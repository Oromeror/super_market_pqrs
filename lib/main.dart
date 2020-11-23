import 'package:flutter/material.dart';

import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/bloc/provider.dart';
import 'package:super_market_pqrs/src/pantallas/ayuda/pantalla_ayuda.dart';
import 'package:super_market_pqrs/src/pantallas/logueo/pantalla_login.dart';
import 'package:super_market_pqrs/src/pantallas/pqrs/componentes/pqrs_usuario.dart';
import 'package:super_market_pqrs/src/pantallas/pqrs/logueado.dart';

// my files imports
import 'package:super_market_pqrs/src/pantallas/principal/pantalla_principal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Super Market Pqrs App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'login': (BuildContext context) => PantallaLogin(),
          'home': (BuildContext context) => PantallaPrincipal(),
          'help': (BuildContext context) => PantallaAyuda(),
          'logued': (BuildContext context) => UsuarioLogueado(),
          'pqrs': (BuildContext context) => PqrsUsuario(),
        },
        theme: ThemeData(
            primaryColor: kColorPrimario,
            accentColor: kColorAsentado,
            primaryColorLight: kColorSuavePrimario,
            scaffoldBackgroundColor: kColorFondoScaffold),
      ),
    );
  }
}
