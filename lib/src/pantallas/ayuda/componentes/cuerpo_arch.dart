import 'dart:io';
import 'dart:convert';
import 'dart:io' as Io;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/componentes/boton_redondeado.dart';
import 'package:super_market_pqrs/src/pantallas/ayuda/arch_adjunto.dart';
import 'package:super_market_pqrs/src/pantallas/ayuda/componentes/fondo.dart';
import 'package:super_market_pqrs/src/pantallas/ayuda/pantalla_ayuda.dart';

class CuerpoArchivo extends State<Adjunto> {
  final GlobalKey<ScaffoldState> _claveScaffold = GlobalKey<ScaffoldState>();
  VoidCallback onTap;
  String _nombreArchivo;
  List<PlatformFile> _rutas;
  String _rutaDirectorio;
  String _extension = 'pdf';
  bool _cargandoRuta = false;
  bool _selMultiple = false;
  FileType _tipoSeleccion = FileType.custom;
  File archivo;
  List<int> _bytes;
  String _pdf64;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    Size tamanho = MediaQuery.of(context).size;
    return MaterialApp(
      home: Fondo(
        child: Scaffold(
          key: _claveScaffold,
          body: Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: tamanho.height * 0.2),
                  Text(
                    "Adjuntar comprobante(s)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kColorPrimario,
                        fontSize: 25),
                  ),
                  SizedBox(height: tamanho.height * 0.01),
                  SvgPicture.asset(
                    "assets/icons/file_searching.svg",
                    height: tamanho.height * 0.20,
                  ),
                  // ConstrainedBox(
                  //   constraints: const BoxConstraints.tightFor(width: 350.0),
                  //   child: SwitchListTile.adaptive(
                  //     title: Text('Seleccionar varios archivos',
                  //         textAlign: TextAlign.left),
                  //     onChanged: (bool value) =>
                  //         setState(() => _selMultiple = value),
                  //     value: _selMultiple,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Column(
                      children: <Widget>[
                        BotonRedondeado(
                          text: 'Seleccionar archivo',
                          press: () => _abrirExploradorDeArchivos(),
                        ),
                        BotonRedondeado(
                          text: 'Borrar archivos temporales',
                          press: () => _borrarArchivosEnCache(),
                        ),
                        BotonRedondeado(
                          text: 'Guardar',
                          press: () => mostrarAlertDialog(context, 'Guardado.'),
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (BuildContext context) => _cargandoRuta
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: const CircularProgressIndicator(),
                          )
                        : _rutaDirectorio != null
                            ? ListTile(
                                title: Text('Directorio de rutas'),
                                subtitle: Text(_rutaDirectorio),
                              )
                            : _rutas != null
                                ? Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.50,
                                    child: Scrollbar(
                                        child: ListView.separated(
                                      itemCount:
                                          _rutas != null && _rutas.isNotEmpty
                                              ? _rutas.length
                                              : 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final bool isMultiPath =
                                            _rutas != null && _rutas.isNotEmpty;
                                        final String name = 'File $index: ' +
                                            (isMultiPath
                                                ? _rutas
                                                    .map((e) => e.name)
                                                    .toList()[index]
                                                : _nombreArchivo ?? '...');
                                        final path = _rutas
                                            .map((e) => e.path)
                                            .toList()[index]
                                            .toString();

                                        return ListTile(
                                          title: Text(
                                            name,
                                          ),
                                          subtitle: Text(path),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const Divider(),
                                    )),
                                  )
                                : const SizedBox(),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  void _abrirExploradorDeArchivos() async {
    setState(() => _cargandoRuta = true);
    try {
      _rutaDirectorio = null;
      _rutas = (await FilePicker.platform.pickFiles(
        type: _tipoSeleccion,
        allowMultiple: _selMultiple,
        allowedExtensions: [_extension],
      ))
          ?.files;
      _codificarArchivo();
    } on PlatformException catch (e) {
      print("Operación no soportada." + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _cargandoRuta = false;
      _nombreArchivo =
          _rutas != null ? _rutas.map((e) => e.name).toString() : '...';
    });
  }

  void _borrarArchivosEnCache() {
    FilePicker.platform.clearTemporaryFiles().then((result) {
      // ignore: deprecated_member_use
      _claveScaffold.currentState.showSnackBar(
        SnackBar(
          backgroundColor: result ? kColorPrimario : Colors.red,
          content: Text(
            (result
                ? 'Archivos temporales eliminados.'
                : 'Error al eliminar archivos temporales'),
            style: TextStyle(
              color: kColorSuavePrimario,
              fontSize: 15,
            ),
          ),
        ),
      );
    });
  }

  _codificarArchivo() {
    print('Nombre archivo: ' + _nombreArchivo);
    _bytes = Io.File(_nombreArchivo).readAsBytesSync();
    _pdf64 = base64Encode(this._bytes);
    print(this._pdf64.substring(0, 100));
    _guardarArchivo(_pdf64);
  }

  // void _seleccionarCarpeta() {
  //   FilePicker.platform.getDirectoryPath().then((value) {
  //     setState(() => _rutaDirectorio = value);
  //   });
  // }

  _guardarArchivo(String pdf64) {
    _enviarArchivo();
  }

  String get pdf64 => _pdf64;

  _enviarArchivo() {
    print(_pdf64);
    Navigator.pushReplacementNamed(context, 'pqrs');
  }

  mostrarAlertDialog(BuildContext context, String mensaje) {
    // Botones
    Widget okButton = FlatButton(
      child: Text("OK", style: TextStyle(color: kColorPrimario, fontSize: 15)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PantallaAyuda()),
        );
      },
    );

    // AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Notificación",
          style: TextStyle(color: kColorPrimario, fontSize: 15)),
      actions: [okButton],
      content: Text(mensaje),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
