import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/bloc/login_bloc.dart';
import 'package:super_market_pqrs/src/bloc/provider.dart';

import 'package:super_market_pqrs/src/componentes/boton_redondeado.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_entrada.dart';
import 'package:super_market_pqrs/src/componentes/ya_tengo_una_cuenta_verificada.dart';
import 'package:super_market_pqrs/src/modelos/usuarios/identificacion.dart';
import 'package:super_market_pqrs/src/pantallas/ayuda/componentes/campo_redondeado_tipo_id.dart';
import 'package:super_market_pqrs/src/pantallas/logueo/pantalla_login.dart';
import 'package:super_market_pqrs/src/pantallas/registro/componentes/divisor_o.dart';
import 'package:super_market_pqrs/src/pantallas/registro/componentes/fondo.dart';
import 'package:super_market_pqrs/src/pantallas/registro/componentes/icono_social.dart';
import 'package:super_market_pqrs/src/proveedores/usuario_proveedor.dart';

class Cuerpo extends StatelessWidget {
  final usuarioProveedor = new UsuarioProveedor();

  String _usernames;
  String _firstName;
  String _lastName;
  String _email;
  String _telefono;
  String _identificacion;
  Identificacion _tipoId;

  @override
  Widget build(BuildContext context) {
    //final bloc = Provider.of(context);
    final Size size = MediaQuery.of(context).size;
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
              icon: Icons.text_format,
              hintText: 'Username',
              onChanged: (value) {
                _usernames = value;
              },
            ),
            CampoRedondeadoEntrada(
              icon: Icons.text_format,
              hintText: 'Nombres',
              onChanged: (value) {
                _firstName = value;
              },
            ),
            CampoRedondeadoEntrada(
              hintText: "Apellidos",
              onChanged: (value) {
                _lastName = value;
              },
            ),
            CampoRedondeadoEntrada(
              icon: Icons.email,
              hintText: "Correo",
              onChanged: (value) {
                _email = value;
              },
            ),
            CampoRedondeadoEntrada(
              icon: Icons.phone,
              hintText: "Teléfono",
              onChanged: (value) {
                _telefono = value;
              },
            ),
            CampoRedondeadoEntrada(
              icon: Icons.text_fields,
              hintText: "Número de identificación",
              onChanged: (value) {
                _identificacion = value;
              },
            ),
            CampoRedondeadoIdentificacion(
              hintText: 'Tipo de indentificación',
              onChanged: (valor) {
                _tipoId = valor;
              },
            ),
            BotonRedondeado(text: "REGISTRARME", press: () {}

                // print(this._usernames);
                // print(this._firstName);
                // print(this._lastName);
                // print(this._email);
                // print(this._telefono);
                // print(this._identificacion);
                // print(this._tipoId);

                //return _registrar(bloc, context);
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

  // _registrar(LoginBloc bloc, BuildContext context) {
  //   usuarioProveedor.nuevoUsuario(
  //       bloc.usernames,
  //       bloc.firstName,
  //       bloc.lastName,
  //       bloc.email,
  //       bloc.telefono,
  //       bloc.identificacion,
  //       bloc.tipoIdentificacion);
  //}
}
