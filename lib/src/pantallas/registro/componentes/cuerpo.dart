import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_market_pqrs/constantes.dart';

import 'package:super_market_pqrs/src/componentes/boton_redondeado.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_contrasenha.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_entrada.dart';
import 'package:super_market_pqrs/src/componentes/ya_tengo_una_cuenta_verificada.dart';
import 'package:super_market_pqrs/src/pantallas/logueo/pantalla_login.dart';
import 'package:super_market_pqrs/src/pantallas/registro/componentes/divisor_o.dart';
import 'package:super_market_pqrs/src/pantallas/registro/componentes/fondo.dart';
import 'package:super_market_pqrs/src/pantallas/registro/componentes/icono_social.dart';

class Cuerpo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Fondo(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "REGISTRARME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorPrimario,
                fontSize: 25,
              ),
            ),
            SizedBox(height: size.height * 0.001),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.12,
            ),
            CampoRedondeadoEntrada(
              icon: Icons.text_fields,
              hintText: "Número de identificación",
              onChanged: (value) {},
            ),
            CampoRedondeadoEntrada(
              hintText: "Nombre",
              onChanged: (value) {},
            ),
            CampoRedondeadoEntrada(
              icon: Icons.email,
              hintText: "Correo",
              onChanged: (value) {},
            ),
            CampoRedondeadoEntrada(
              icon: Icons.phone,
              hintText: "Teléfono",
              onChanged: (value) {},
            ),
            CampoRedondeadoContrasenha(
              onChanged: (value) {},
            ),
            BotonRedondeado(
              text: "REGISTRARME",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            YaTengoUnaCuentaVerificada(
              login: false,
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
            DivisorO(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconoSocial(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                IconoSocial(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                IconoSocial(
                  iconSrc: "assets/icons/google.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
