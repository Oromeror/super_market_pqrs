import 'package:flutter/material.dart';
import 'package:super_market_pqrs/constantes.dart';

//My fyles imports
import 'package:super_market_pqrs/src/pantallas/principal/pantalla_principal.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: kColorPrimario),
      home: Center(
        child: PantallaPrincipal(),
      ),
    );
  }
}
