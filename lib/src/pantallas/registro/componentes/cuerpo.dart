import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_market_pqrs/constantes.dart';

import 'package:super_market_pqrs/src/bloc/login_bloc.dart';
import 'package:super_market_pqrs/src/bloc/provider.dart';
import 'package:super_market_pqrs/src/componentes/boton_redondeado.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_entrada.dart';
import 'package:super_market_pqrs/src/componentes/ya_tengo_una_cuenta_verificada.dart';
import 'package:super_market_pqrs/src/pantallas/ayuda/componentes/campo_redondeado_tipo_id.dart';
import 'package:super_market_pqrs/src/pantallas/logueo/pantalla_login.dart';
import 'package:super_market_pqrs/src/pantallas/registro/componentes/divisor_o.dart';
import 'package:super_market_pqrs/src/pantallas/registro/componentes/fondo.dart';
import 'package:super_market_pqrs/src/pantallas/registro/componentes/icono_social.dart';
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
    return Fondo(child: _crearRegistroForm(context));
  }

  Widget _crearRegistroForm(BuildContext context) {
    final bloc = Provider.of(context);
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(
          //   "REGISTRARME",
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     color: kColorPrimario,
          //     fontSize: 25,
          //   ),
          // ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            "assets/icons/signup.svg",
            height: size.height * 0.12,
          ),
          crearCampoUsername(bloc),
          crearCampoNombres(bloc),
          crearCampoApellidos(bloc),
          crearCampoCorreo(bloc),
          crearCampoTelefono(bloc),
          crearCampoIdentificacion(bloc),
          crearCampoTipoId(bloc),
          crearBotonRegistrar(bloc),
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
    );
  }

  crearCampoUsername(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.usernamesStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: CampoRedondeadoEntrada(
              hintText: 'Username',
              onChanged: (value) => bloc.changeUsernames(value),
            ),
          );
        });
  }

  crearCampoNombres(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.firstNameStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: CampoRedondeadoEntrada(
              icon: Icons.text_fields,
              hintText: 'Nombres',
              onChanged: (value) => bloc.changeFirstName(value),
            ),
          );
        });
  }

  crearCampoApellidos(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.lastNameStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: CampoRedondeadoEntrada(
              icon: Icons.text_format,
              hintText: "Apellidos",
              onChanged: (value) => bloc.changeLastName(value),
            ),
          );
        });
  }

  crearCampoCorreo(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: CampoRedondeadoEntrada(
              icon: Icons.email,
              hintText: "Correo",
              onChanged: (value) => bloc.changeEmail(value),
            ),
          );
        });
  }

  crearCampoTelefono(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.telefonoStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: CampoRedondeadoEntrada(
              icon: Icons.phone,
              hintText: "Teléfono",
              onChanged: (value) => bloc.changeTelefono(value),
            ),
          );
        });
  }

  crearCampoIdentificacion(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.identificacionStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: CampoRedondeadoEntrada(
              icon: Icons.credit_card,
              hintText: "Número de identificación",
              onChanged: (value) => bloc.changeIdentificacion(value),
            ),
          );
        });
  }

  crearCampoTipoId(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.tipoIdStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: CampoRedondeadoIdentificacion(
                hintText: 'Tipo de indentificación',
                onChanged: (value) =>
                    bloc.changeTipoIdentificacion(value.nombre)),
          );
        });
  }

  crearBotonRegistrar(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.registrarFormValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: BotonRedondeado(
                text: "REGISTRARME",
                press: snapshot.hasData
                    ? () => _generarRegistro(bloc, context)
                    : null),
          );
        });
  }

  _generarRegistro(LoginBloc bloc, BuildContext context) {
    usuarioProveedor.nuevoUsuario(
        bloc.usernames,
        bloc.firstName,
        bloc.lastName,
        bloc.email,
        bloc.telefono,
        bloc.identificacion,
        bloc.tipoIdentificacion);

    print('================');
    print('username: ${bloc.usernames}');
    print('Nombre: ${bloc.firstName}');
    print('Apellido: ${bloc.lastName}');
    print('Correo: ${bloc.email}');
    print('Teléfono: ${bloc.telefono}');
    print('Identificación: ${bloc.identificacion}');
    print('Tipo de identificación: ${bloc.tipoIdentificacion}');
    print('================');

    mostrarAlertDialog(context, 'Por favor revise su correo.');
  }

  mostrarAlertDialog(BuildContext context, String mensaje) {
    // Botones
    Widget okButton = FlatButton(
      child: Text("OK", style: TextStyle(color: kColorPrimario, fontSize: 15)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PantallaLogin()),
        );
      },
    );

    // AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Notificación",
          style: TextStyle(color: kColorPrimario, fontSize: 15)),
      actions: [okButton],
      content: Text(mensaje),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
