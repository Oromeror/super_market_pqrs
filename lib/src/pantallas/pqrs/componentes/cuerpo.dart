import 'package:flutter/material.dart';
import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/componentes/boton_redondeado.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_entrada.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_tipo_id.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_tipo_pqr.dart';
import 'package:super_market_pqrs/src/modelos/archivos/arch_adjunto.dart';
import 'package:super_market_pqrs/src/pantallas/pqrs/componentes/fondo.dart';

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
              "REALIZAR PQR",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorPrimario,
                  fontSize: 25),
            ),
            /*SizedBox(height: size.height * 0.000001),
            SvgPicture.asset(
              "assets/icons/form.svg",
              height: size.height * 0.10,
            ),*/
            CampoRedondeadoTipoPqr(
              hintText: 'Tipo de radicado',
            ),
            CampoRedondeadoIdentificacion(
              hintText: 'Tipo de indentificación',
            ),
            CampoRedondeadoEntrada(
              icon: Icons.text_fields,
              hintText: "Número de identificación",
              onChanged: (value) {},
            ),
            CampoRedondeadoEntrada(
              hintText: "Nombre completo",
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
            CampoRedondeadoEntrada(
              icon: Icons.comment,
              hintText: "Comentario",
              onChanged: (value) {},
            ),
            BotonRedondeado(
              text: "Adjuntar archivo",
              press: () {
                return Adjunto();
              },
            ),
            BotonRedondeado(
              text: "ENVIAR",
              press: () {},
            ),
            SizedBox(height: size.height * 0.001),
          ],
        ),
      ),
    );
  }
}
