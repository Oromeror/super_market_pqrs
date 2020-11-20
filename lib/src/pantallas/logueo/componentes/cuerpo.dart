import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/bloc/login_bloc.dart';
import 'package:super_market_pqrs/src/bloc/provider.dart';
import 'package:super_market_pqrs/src/componentes/boton_redondeado.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_contrasenha.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_entrada.dart';
import 'package:super_market_pqrs/src/componentes/ya_tengo_una_cuenta_verificada.dart';
import 'package:super_market_pqrs/src/pantallas/logueo/componentes/fondo.dart';
import 'package:super_market_pqrs/src/pantallas/registro/pantalla_registro.dart';
import 'package:super_market_pqrs/src/proveedores/usuario_proveedor.dart';

class Cuerpo extends StatelessWidget {
  final usuarioProveedor = new UsuarioProveedor();
  final ValueChanged<String> onChangedId;
  final ValueChanged<String> onChangedPass;

  Cuerpo({
    Key key,
    this.onChangedId,
    this.onChangedPass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final bloc = Provider.of(context);
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
              hintText: "Identificación:",
              onChanged: onChangedId,
            ),
            CampoRedondeadoContrasenha(
              onChanged: onChangedPass,
            ),
            BotonRedondeado(
                text: "INICIAR SESIÓN",
                press: () {
                  // print(this.onChangedId.toString());
                  // print(this.onChangedPass.toString());
                  // return _iniciarSesion(bloc, context);
                }),
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

  // _iniciarSesion(LoginBloc bloc, BuildContext context) {
  //   usuarioProveedor.login(bloc.identificacion, bloc.password);
  // }
}
