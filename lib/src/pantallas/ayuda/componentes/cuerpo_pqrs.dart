import 'package:flutter/material.dart';

import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/bloc/login_bloc.dart';
import 'package:super_market_pqrs/src/bloc/provider.dart';
import 'package:super_market_pqrs/src/componentes/boton_redondeado.dart';
import 'package:super_market_pqrs/src/componentes/campo_redondeado_entrada.dart';
import 'package:super_market_pqrs/src/pantallas/ayuda/arch_adjunto.dart';
import 'package:super_market_pqrs/src/pantallas/ayuda/componentes/campo_redondeado_tipo_id.dart';
import 'package:super_market_pqrs/src/pantallas/ayuda/componentes/campo_redondeado_tipo_pqr.dart';
import 'package:super_market_pqrs/src/pantallas/ayuda/componentes/fondo.dart';
import 'package:super_market_pqrs/src/pantallas/pqrs/logueado.dart';
import 'package:super_market_pqrs/src/proveedores/pqrs_proveedor.dart';

class CuerpoPqrs extends StatelessWidget {
  final pqrsProveedor = new PqrsProveedor();

  CuerpoPqrs({
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
    return Fondo(child: _crearPqrsForm(context));
  }

  Widget _crearPqrsForm(BuildContext context) {
    final bloc = Provider.of(context);
    final _llaveFormulario = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _llaveFormulario,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Text(
              "REALIZA UNA PQRS",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorPrimario,
                  fontSize: 25),
            ),
            crearTipoRadicado(bloc),
            //crearTipoIdentificacion(bloc),
            crearCampoIdentificacion(bloc),
            //crearCampoNombre(bloc),
            //crearCampoCorreo(bloc),
            //crearCampoTelefono(bloc),
            crearCampoComentario(bloc),
            crearBotonAdjuntar(bloc),
            crearBotonEnviar(bloc),
            SizedBox(height: size.height * 0.001),
          ],
        ),
      ),
    );
  }

  Widget crearTipoRadicado(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.tipoRadStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: CampoRedondeadoTipoPqr(
            hintText: 'Tipo de radicado',
            onChanged: (value) => bloc.changeTipoRadicado(value.toString()),
          ),
        );
      },
    );
  }

  crearTipoIdentificacion(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.tipoIdStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: CampoRedondeadoIdentificacion(
              hintText: 'Tipo de indentificación',
              onChanged: (value) => bloc.changeIdentificacion(value.toString()),
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
              icon: Icons.text_fields,
              hintText: "Número de identificación",
              validator: (String valor) {
                if (valor.isEmpty) {
                  return 'Número de identificación requerido.';
                }
              },
              onChanged: (value) => bloc.changeIdentificacion(value.toString()),
            ),
          );
        });
  }

  crearCampoNombre(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.firstNameStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: CampoRedondeadoEntrada(
                hintText: "Nombre completo",
                validator: (String valor) {
                  if (valor.isEmpty) {
                    return 'Nombre completo requerido.';
                  }
                },
                onChanged: (value) => bloc.changeFirstName(value)),
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
                onChanged: (value) => bloc.changeEmail(value)),
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
                validator: (String valor) {
                  if (valor.isEmpty) {
                    return 'Teléfono requerido.';
                  }
                },
                onChanged: (value) => bloc.changeTelefono(value)),
          );
        });
  }

  crearCampoComentario(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.comentarioStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: CampoRedondeadoEntrada(
                icon: Icons.comment,
                hintText: "Comentario",
                validator: (String valor) {
                  if (valor.isEmpty) {
                    return 'Comentario requerido.';
                  }
                },
                onChanged: (value) => bloc.changeComentario(value)),
          );
        });
  }

  crearBotonAdjuntar(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.archAdjuntoStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: BotonRedondeado(
              text: "ADJUNTAR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Adjunto()),
                );
              },
            ),
          );
        });
  }

  crearBotonEnviar(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.helpFormValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
              child: BotonRedondeado(
            text: "ENVIAR",
            press: () => _generarPqrs(bloc, context),
          ));
        });
  }

  _generarPqrs(LoginBloc bloc, BuildContext context) {
    pqrsProveedor.generarPqrs(bloc.identificacion, bloc.tipoRadicado,
        bloc.comentario, bloc.archAdjunto);
    print('================');
    print('Identificación: ${bloc.identificacion}');
    print('Tipo de radicado: ${bloc.tipoRadicado}');
    print('Comentario: ${bloc.comentario}');
    print('Anexo: ${bloc.archAdjunto}');
    print('================');

    mostrarAlertDialog(context, 'Pqrs creada.');
  }

  mostrarAlertDialog(BuildContext context, String mensaje) {
    // Botones
    Widget okButton = FlatButton(
      child: Text("OK", style: TextStyle(color: kColorPrimario, fontSize: 15)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UsuarioLogueado()),
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
