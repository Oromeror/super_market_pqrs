import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:super_market_pqrs/src/pantallas/logueo/pantalla_login.dart';
import 'package:super_market_pqrs/src/pantallas/registro/pantalla_registro.dart';
import 'package:super_market_pqrs/src/pantallas/bienvenida/componentes/fondo.dart';
import 'package:super_market_pqrs/src/componentes/boton_redondeado.dart';
import 'package:super_market_pqrs/constantes.dart';

class Cuerpo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Fondo(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "PQRS SUPER MARKET",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: kColorPrimario),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/welcome.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            BotonRedondeado(
              text: "INICIAR SESIÓN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PantallaLogin();
                    },
                  ),
                );
              },
            ),
            BotonRedondeado(
              text: "REGISTRARSE",
              color: kColorSuavePrimario,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PantallaRegistro();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
