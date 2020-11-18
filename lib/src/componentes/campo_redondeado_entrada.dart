import 'package:flutter/material.dart';

import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/componentes/contenedor_texto.dart';

class CampoRedondeadoEntrada extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const CampoRedondeadoEntrada({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
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
}
