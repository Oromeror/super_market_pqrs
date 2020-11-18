import 'package:flutter/material.dart';

import 'package:super_market_pqrs/constantes.dart';

class YaTengoUnaCuentaVerificada extends StatelessWidget {
  final bool login;
  final Function press;
  const YaTengoUnaCuentaVerificada({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "¿Aún no tiene cuenta? " : "¿Ya tiene una cuenta? ",
          style: TextStyle(color: kColorPrimario),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Registrarse" : "Iniciar sesión",
            style: TextStyle(
              color: kColorPrimario,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
