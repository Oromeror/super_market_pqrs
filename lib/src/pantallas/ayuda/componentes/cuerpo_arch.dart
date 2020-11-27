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
import 'package:super_market_pqrs/src/proveedores/pqrs_proveedor.dart';

class CuerpoArchivo extends State<Adjunto> {
  final pqrsProveedor = new PqrsProveedor();
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
      debugShowCheckedModeBanner: false,
      home: Fondo(
        child: Scaffold(
          appBar: _construirAppBar(context),
          key: _claveScaffold,
          body: Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: tamanho.height * 0.01),
                  SvgPicture.asset(
                    "assets/icons/file_searching.svg",
                    height: tamanho.height * 0.28,
                  ),
                  _construirMultiples(context),
                  _construirOpciones(context),
                  _construirSeleccionadorArchivos(context),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  Widget _construirAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Adjuntar comprobante(s)",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: kColorPrimario,
          fontSize: 25,
        ),
      ),
      backgroundColor: kColorFondoScaffold,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
        color: kColorPrimario,
      ),
    );
  }

  Widget _construirMultiples(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 350.0),
      child: SwitchListTile.adaptive(
        title: Text('Seleccionar varios archivos', textAlign: TextAlign.left),
        onChanged: (bool value) => setState(() => _selMultiple = value),
        value: _selMultiple,
      ),
    );
  }

  Widget _construirOpciones(BuildContext context) {
    return Padding(
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
        ],
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
      codificarArchivo();
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

  Widget _construirSeleccionadorArchivos(BuildContext context) {
    return Builder(
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
                      padding: const EdgeInsets.only(bottom: 30.0),
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: Scrollbar(
                          child: ListView.separated(
                        itemCount: _rutas != null && _rutas.isNotEmpty
                            ? _rutas.length
                            : 1,
                        itemBuilder: (BuildContext context, int index) {
                          final bool isMultiPath =
                              _rutas != null && _rutas.isNotEmpty;
                          final String name = 'File $index: ' +
                              (isMultiPath
                                  ? _rutas.map((e) => e.name).toList()[index]
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
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      )),
                    )
                  : const SizedBox(),
    );
  }

  String codificarArchivo() {
    this._bytes = Io.File(_rutas[0].path).readAsBytesSync();
    this._pdf64 = base64Encode(this._bytes);
    return this._pdf64;
  }
}
