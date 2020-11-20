//import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/modelos/pqrs/tipo_radicado.dart';

class CampoRedondeadoTipoPqr extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<TipoRadicado> onChanged;

  CampoRedondeadoTipoPqr({
    Key key,
    this.hintText,
    this.icon = Icons.tab,
    this.onChanged,
  }) : super(key: key);

  @override
  EstadoDesplegableTipoPqrs createState() => EstadoDesplegableTipoPqrs();
}

class EstadoDesplegableTipoPqrs extends State<CampoRedondeadoTipoPqr> {
  List<TipoRadicado> tipoRadicado = TipoRadicado.obtenerTipoRadicado();
  List<DropdownMenuItem<TipoRadicado>> tipoRadicadoDesplegado;
  TipoRadicado tipoRadicadoSeleccionado;

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

  // alCambiarTipoRadicado(TipoRadicado tipoRadSel) {
  //   setState(() {
  //     tipoRadicadoSeleccionado = tipoRadSel;
  //   });
  // }

  Widget construirCampoTipoRadicado() {
    Size tamanho = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: tamanho.width * 0.8,
      decoration: BoxDecoration(
        color: kColorSuavePrimario,
        borderRadius: BorderRadius.circular(29),
      ),
      child: DropdownButton(
        hint: Text(widget.hintText),
        value: this.tipoRadicadoSeleccionado,
        items: this.tipoRadicadoDesplegado,
        onChanged: widget.onChanged,
      ),
    );
  }

  // Widget construirCampoTipoRadicadoPrueba() {
  //   return DropDownField(
  //     enabled: true,
  //     required: true,
  //     value: this.tipoRadicadoSeleccionado.toString(),
  //     items: ,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    //return construirCampoTipoRadicadoPrueba();
    return construirCampoTipoRadicado();
  }
}
