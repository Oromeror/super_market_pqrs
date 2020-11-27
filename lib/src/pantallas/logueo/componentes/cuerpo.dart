import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/bloc/general_bloc.dart';
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

  Cuerpo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_crearFondo(context)],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    return Fondo(child: _crearLoginForm(context));
  }

  Widget _crearLoginForm(BuildContext context) {
    final bloc = Provider.of(context);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
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
          _crearIdentificacion(bloc),
          _crearPassword(bloc),
          _crearBoton(bloc),
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
    );
  }

  Widget _crearIdentificacion(GeneralBloc bloc) {
    return StreamBuilder(
      stream: bloc.identificacionStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot.data);
        return Container(
          child: CampoRedondeadoEntrada(
            icon: Icons.text_fields,
            hintText: "Identificación:",
            validator: (String valor) {
              if (valor.isEmpty) return 'Número de identificación requerido.';
            },
            onChanged: (value) => bloc.changeIdentificacion(value),
          ),
        );
      },
    );
  }

  Widget _crearPassword(GeneralBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: CampoRedondeadoContrasenha(
            onChanged: (value) => bloc.changePassword(value),
          ),
        );
      },
    );
  }

  Widget _crearBoton(GeneralBloc bloc) {
    return StreamBuilder(
      stream: bloc.loginFormValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: BotonRedondeado(
              text: "INICIAR SESIÓN",
              press: snapshot.hasData ? () => _login(bloc, context) : null),
        );
      },
    );
  }

  _login(GeneralBloc bloc, BuildContext context) {
    usuarioProveedor.login(bloc.identificacion, bloc.password);
    Navigator.pushReplacementNamed(context, 'logued');
    print('================');
    print('Identificación: ${bloc.identificacion}');
    print('Password: ${bloc.password}');
    print('================');
  }
}
