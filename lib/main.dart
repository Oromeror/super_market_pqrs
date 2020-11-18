import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:super_market_pqrs/constantes.dart';

// my files imports
//import 'package:ing_sof_1/src/app.dart';
//import 'package:super_market_pqrs/src/pantallas/principal.dart';
//import 'package:super_market_pqrs/src/pantallas/form_ayuda.dart';
import 'package:super_market_pqrs/src/pantallas/Bienvenida/bienvenida.dart';
import 'package:super_market_pqrs/src/pantallas/principal/pantalla_principal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  build(BuildContext context) {
    return MaterialApp(
      title: 'Super Market Pqrs App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kColorPrimario,
          accentColor: kColorAsentado,
          primaryColorLight: kColorSuavePrimario,
          scaffoldBackgroundColor: kColorFondoScaffold),
      home: PantallaPrincipal(),
    );
  }
}
