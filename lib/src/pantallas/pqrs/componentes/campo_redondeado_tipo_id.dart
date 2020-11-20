import 'package:flutter/material.dart';
import 'package:super_market_pqrs/constantes.dart';

import 'package:super_market_pqrs/src/modelos/usuarios/identificacion.dart';

class CampoRedondeadoIdentificacion extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<Identificacion> onChanged;

  CampoRedondeadoIdentificacion({
    Key key,
    this.hintText,
    this.icon = Icons.tab,
    this.onChanged,
  }) : super(key: key);

  @override
  EstadoDesplegableTipoId createState() => EstadoDesplegableTipoId();
}

class EstadoDesplegableTipoId extends State<CampoRedondeadoIdentificacion> {
  List<Identificacion> _tipoIdentificacion =
      Identificacion.obtenerIdentificacion();
  List<DropdownMenuItem<Identificacion>> _identificacionDesplegada;
  Identificacion _identificacionSeleccionada;

  @override
  void initState() {
    _identificacionDesplegada =
        construirItemsIdentificaciones(_tipoIdentificacion);
    _identificacionSeleccionada = _tipoIdentificacion[0];
    super.initState();
  }

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

  Widget _construirCampoTipoIdentificacion() {
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
        value: this._identificacionSeleccionada,
        items: this._identificacionDesplegada,
        onChanged: widget.onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _construirCampoTipoIdentificacion();
  }
}
