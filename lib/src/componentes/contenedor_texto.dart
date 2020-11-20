import 'package:flutter/material.dart';

import 'package:super_market_pqrs/constantes.dart';

class ContenedorTexto extends StatelessWidget {
  final Widget child;
  const ContenedorTexto({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kColorSuavePrimario,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
