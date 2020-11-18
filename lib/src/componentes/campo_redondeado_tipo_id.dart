import 'package:flutter/material.dart';
import 'package:super_market_pqrs/constantes.dart';

import 'package:super_market_pqrs/src/componentes/contenedor_texto.dart';
import 'package:super_market_pqrs/src/modelos/usuarios/identificacion.dart';

class CampoRedondeadoIdentificacion extends StatefulWidget {
  CampoRedondeadoIdentificacion({
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

class DropDownState extends State<CampoRedondeadoIdentificacion> {
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
    return DropdownButton(
      value: _identificacionSeleccionada,
      items: _identificacionDesplegada,
      onChanged: alCambiarIdentificacion,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContenedorTexto(
      child: _construirCampoTipoIdentificacion(),
    );
  }
}
