import 'package:flutter/material.dart';

import 'package:super_market_pqrs/constantes.dart';

class BotonRedondeado extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const BotonRedondeado({
    Key key,
    this.text,
    this.press,
    this.color = kColorPrimario,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
