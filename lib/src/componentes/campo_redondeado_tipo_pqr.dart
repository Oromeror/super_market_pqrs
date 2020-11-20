import 'package:flutter/material.dart';
import 'package:super_market_pqrs/constantes.dart';

import 'package:super_market_pqrs/src/componentes/contenedor_texto.dart';
import 'package:super_market_pqrs/src/modelos/pqrs/tipo_radicado.dart';

class CampoRedondeadoTipoPqr extends StatefulWidget {
  CampoRedondeadoTipoPqr({
    Key key,
    this.hintText,
    this.icon = Icons.tab,
    this.onChanged,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final ValueChanged<TipoRadicado> onChanged;

  Widget build(BuildContext context, DropDownState estado) {
    return ContenedorTexto(child: estado.build(context));
  }

  @override
  DropDownState createState() => DropDownState();
}

class DropDownState extends State<CampoRedondeadoTipoPqr> {
  List<TipoRadicado> tipoRadicado = TipoRadicado.obtenerTipoRadicado();
  List<DropdownMenuItem<TipoRadicado>> tipoRadicadoDesplegado;
  TipoRadicado tipoRadicadoSeleccionado;
  final String hintText;
  final ValueChanged<TipoRadicado> onChanged;
  DropDownState({this.hintText, this.onChanged}) : super();

  @override
  void initState() {
    tipoRadicadoDesplegado = construirItemsRadicados(tipoRadicado);
    tipoRadicadoSeleccionado = tipoRadicado[0];
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
      print('hola');
      tipoRadicadoSeleccionado = tipoRadSel;
    });
  }

  Widget construirCampoTipoRadicado() {
    return DropdownButton(
      hint: Text('Tipo de radicado'),
      value: tipoRadicadoSeleccionado,
      items: tipoRadicadoDesplegado,
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
      child: construirCampoTipoRadicado(),
    );
  }
}
