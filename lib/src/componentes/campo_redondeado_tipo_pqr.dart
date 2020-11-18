import 'package:flutter/material.dart';
import 'package:super_market_pqrs/constantes.dart';

import 'package:super_market_pqrs/src/componentes/contenedor_texto.dart';
import 'package:super_market_pqrs/src/modelos/pqrs/tipo_radicado.dart';

class CampoRedondeadoTipoPqr extends StatefulWidget {
  CampoRedondeadoTipoPqr({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  Widget build(BuildContext context) {
    return ContenedorTexto(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kColorPrimario,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kColorPrimario,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  DropDownState createState() => DropDownState();
}

class DropDownState extends State<CampoRedondeadoTipoPqr> {
  List<TipoRadicado> _tipoRadicado = TipoRadicado.obtenerTipoRadicado();
  List<DropdownMenuItem<TipoRadicado>> _tipoRadicadoDesplegado;
  TipoRadicado _tipoRadicadoSeleccionado;
  final String hintText;

  DropDownState({this.hintText}) : super();

  @override
  void initState() {
    _tipoRadicadoDesplegado = construirItemsRadicados(_tipoRadicado);
    _tipoRadicadoSeleccionado = _tipoRadicado[0];
    super.initState();
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

  Widget _construirCampoTipoRadicado() {
    return DropdownButton(
      hint: Text('Tipo de radicado'),
      value: _tipoRadicadoSeleccionado,
      items: _tipoRadicadoDesplegado,
      onChanged: alCambiarTipoRadicado,
    );
  }

  /*
  Widget _construirCampoTipoRadicadoPrueba() {
    return DropDownField(
      enabled: true,
      required: true,
      value: _tipoRadicadoSeleccionado,
      items: _tipoRadicadoDesplegado,
      onValueChanged: alCambiarTipoRadicado,
      hintText: 'Tipo de radicado',
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return ContenedorTexto(
      child: _construirCampoTipoRadicado(),
    );
  }
}
