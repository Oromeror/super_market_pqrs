import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/componentes/boton_redondeado.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_contrasenha.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_entrada.dart';
import 'package:super_market_pqrs/src/componentes/ya_tengo_una_cuenta_verificada.dart';
import 'package:super_market_pqrs/src/pantallas/logueo/componentes/fondo.dart';
import 'package:super_market_pqrs/src/pantallas/registro/pantalla_registro.dart';

class Cuerpo extends StatelessWidget {
  const Cuerpo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Fondo(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "INICIAR SESIÓN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorPrimario,
                fontSize: 25,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            CampoRedondeadoEntrada(
              hintText: "Correo:",
              onChanged: (value) {},
            ),
            CampoRedondeadoContrasenha(
              onChanged: (value) {},
            ),
            BotonRedondeado(
              text: "INICIAR SESIÓN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            YaTengoUnaCuentaVerificada(
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
