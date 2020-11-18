import 'package:flutter/material.dart';
import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/modelos/pqrs/tipo_radicado.dart';
import 'package:super_market_pqrs/src/modelos/usuarios/identificacion.dart';

class FormularioAyuda extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioAyudaEstado();
  }
}

class FormularioAyudaEstado extends State<FormularioAyuda> {
  List<Identificacion> _tipoIdentificacion =
      Identificacion.obtenerIdentificacion();
  List<DropdownMenuItem<Identificacion>> _identificacionDesplegada;
  Identificacion _identificacionSeleccionada;

  String _numeroIdentificacion;
  String _nombreCompleto;
  String _correoElectronico;
  int _numeroTelefono;

  List<TipoRadicado> _tipoRadicado = TipoRadicado.obtenerTipoRadicado();
  List<DropdownMenuItem<TipoRadicado>> _tipoRadicadoDesplegado;
  TipoRadicado _tipoRadicadoSeleccionado;

  String _comentarios;
  List<String> anexos;

  @override
  void initState() {
    _identificacionDesplegada =
        construirItemsIdentificaciones(_tipoIdentificacion);
    _identificacionSeleccionada = _tipoIdentificacion[0];

    _tipoRadicadoDesplegado = construirItemsRadicados(_tipoRadicado);
    _tipoRadicadoSeleccionado = _tipoRadicado[0];

    super.initState();
  }

  final GlobalKey<FormState> _llaveFormulario = GlobalKey<FormState>();

  List<DropdownMenuItem<Identificacion>> construirItemsIdentificaciones(
      List identificaciones) {
    List<DropdownMenuItem<Identificacion>> items = List();
    for (Identificacion identificacion in identificaciones) {
      items.add(
        DropdownMenuItem(
          value: identificacion,
          child: new Text(identificacion.nombre),
        ),
      );
    }
    return items;
  }

  alCambiarIdentificacion(Identificacion identificacionSel) {
    setState(() {
      _identificacionSeleccionada = identificacionSel;
    });
  }

  List<DropdownMenuItem<TipoRadicado>> construirItemsRadicados(List radicados) {
    List<DropdownMenuItem<TipoRadicado>> items = List();
    for (TipoRadicado tipoRadicado in radicados) {
      items.add(
        DropdownMenuItem(
          value: tipoRadicado,
          child: new Text(tipoRadicado.nombre),
        ),
      );
    }
    return items;
  }

  alCambiarTipoRadicado(TipoRadicado tipoRadSel) {
    setState(() {
      _tipoRadicadoSeleccionado = tipoRadSel;
    });
  }

  Widget construirCampoTipoIdentificacion() {
    return DropdownButton(
      value: _identificacionSeleccionada,
      items: _identificacionDesplegada,
      onChanged: alCambiarIdentificacion,
    );
  }

  Widget _construirNumeroIdentificacion() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Número de identifiacción'),
      validator: (String valor) {
        return 'El campo es requerido.';
      },
      onSaved: (String valor) {
        _numeroIdentificacion = valor;
      },
    );
  }

  Widget _construirNombreCompleto() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombre completo'),
      validator: (String valor) {
        return 'El campo es requerido.';
      },
      onSaved: (String valor) {
        _nombreCompleto = valor;
      },
    );
  }

  Widget _construirCorreoElectronico() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Correo electrónico'),
      validator: (String valor) {
        if (valor.isEmpty) {
          return 'El campo es requerido';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(valor)) {
          return 'Ingrese un correo valido.';
        }

        return null;
      },
      onSaved: (String valor) {
        _correoElectronico = valor;
      },
    );
  }

  Widget _construirNumeroTelefono() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Número de teléfono'),
      validator: (String valor) {
        return 'El campo es requerido.';
      },
      onSaved: (String valor) {
        _numeroIdentificacion = valor;
      },
    );
  }

  Widget _construirCampoTipoRadicado() {
    return DropdownButton(
      value: _tipoRadicadoSeleccionado,
      items: _tipoRadicadoDesplegado,
      onChanged: alCambiarTipoRadicado,
    );
  }

  Widget _construirComentarios() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Comentario'),
      validator: (String valor) {
        return 'El campo es requerido.';
      },
      onSaved: (String valor) {
        _numeroIdentificacion = valor;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimario,
        title: Text(
          'Realiza tu PQRS',
          style: TextStyle(color: Colors.white, fontSize: 21),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
            key: _llaveFormulario,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tipo de radicado',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _construirCampoTipoRadicado(),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Seleccione el tipo de identificación',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: construirCampoTipoIdentificacion(),
                ),
                _construirNumeroIdentificacion(),
                _construirNombreCompleto(),
                _construirCorreoElectronico(),
                _construirNumeroTelefono(),
                _construirComentarios(),
                SizedBox(height: 100),
                RaisedButton(
                  color: kColorPrimario,
                  child: Text(
                    'Enviar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    if (!_llaveFormulario.currentState.validate()) {
                      return;
                    }
                    _llaveFormulario.currentState.save();
                    print(_tipoIdentificacion);
                    print(_numeroIdentificacion);
                    print(_nombreCompleto);
                    print(_correoElectronico);
                    print(_numeroTelefono);
                    print(_tipoRadicado);
                    print(_comentarios);

                    //Enviar al servidor
                  },
                )
              ],
            )),
      ),
    );
  }
}
