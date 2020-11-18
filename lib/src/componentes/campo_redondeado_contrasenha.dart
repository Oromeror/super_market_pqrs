import 'package:flutter/material.dart';

import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/componentes/contenedor_texto.dart';

class CampoRedondeadoContrasenha extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const CampoRedondeadoContrasenha({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContenedorTexto(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kColorPrimario,
        decoration: InputDecoration(
          hintText: "Contraseña",
          icon: Icon(
            Icons.lock,
            color: kColorPrimario,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kColorPrimario,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
