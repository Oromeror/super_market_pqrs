import 'package:flutter/material.dart';
import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/componentes/boton_redondeado.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_entrada.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_tipo_id.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_tipo_pqr.dart';
import 'package:super_market_pqrs/src/pantallas/pqrs/componentes/arch_adjunto.dart';
import 'package:super_market_pqrs/src/pantallas/pqrs/componentes/fondo.dart';

class CuerpoPqrs extends StatelessWidget {
  final _llaveFormulario = GlobalKey<FormState>();

  String _tipoRadicado;
  String _tipoIdentificacion;
  String _numeroIdentificacion;
  String _nombreCompleto;
  String _correoElectronico;
  int _numeroTelefono;
  String _comentarios;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Fondo(
      key: _llaveFormulario,
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
            CampoRedondeadoTipoPqr(
              hintText: 'Tipo de radicado',
              onChanged: (String valor) {
                _tipoRadicado = valor;
              },
            ),
            CampoRedondeadoIdentificacion(
              hintText: 'Tipo de indentificación',
              onChanged: (String valor) {
                _tipoIdentificacion = valor;
              },
            ),
            CampoRedondeadoEntrada(
              icon: Icons.text_fields,
              hintText: "Número de identificación",
              validator: (String valor) {
                if (valor.isEmpty) {
                  return 'Número de identificación requerido.';
                }
              },
              onChanged: (String valor) {
                _numeroIdentificacion = valor;
              },
            ),
            CampoRedondeadoEntrada(
              hintText: "Nombre completo",
              validator: (String valor) {
                if (valor.isEmpty) {
                  return 'Nombre completo requerido.';
                }
              },
              onChanged: (valor) {
                _nombreCompleto = valor;
              },
            ),
            CampoRedondeadoEntrada(
              icon: Icons.email,
              hintText: "Correo",
              validator: (String valor) {
                if (valor.isEmpty) {
                  return 'Correo requerido.';
                }

                if (!RegExp(
                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                    .hasMatch(valor)) {
                  return 'Por favor ingrese un correo valido';
                }

                return null;
              },
              onChanged: (valor) {
                _correoElectronico = valor;
              },
            ),
            CampoRedondeadoEntrada(
              icon: Icons.phone,
              hintText: "Teléfono",
              onChanged: (valor) {
                _numeroTelefono = int.parse(valor);
              },
            ),
            CampoRedondeadoEntrada(
              icon: Icons.comment,
              hintText: "Comentario",
              onChanged: (valor) {
                _comentarios = valor;
              },
            ),
            BotonRedondeado(
              text: "ADJUNTAR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Adjunto()),
                );
              },
            ),
            BotonRedondeado(
              text: "ENVIAR",
              press: () {
                if (!_llaveFormulario.currentState.validate()) {
                  return;
                }
                _llaveFormulario.currentState.save();
                print(_tipoRadicado);
                print(_tipoIdentificacion);
                print(_numeroIdentificacion);
                print(_nombreCompleto);
                print(_correoElectronico);
                print(_numeroTelefono);
                print(_comentarios);
              },
            ),
            SizedBox(height: size.height * 0.001),
          ],
        ),
      ),
    );
  }
}
