import 'package:flutter/material.dart';

import 'package:super_market_pqrs/constantes.dart';

// my files imports
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
