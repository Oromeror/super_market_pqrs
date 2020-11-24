import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/pantallas/pqrs/componentes/pqrs_usuario.dart';

import 'carrusel_preguntas.dart';

class Cuerpo extends State<PqrsUsuario> {
  int _indiceSeleccionado = 0;
  //int _opcionActual = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.handPaper,
    FontAwesomeIcons.meh,
    FontAwesomeIcons.frown,
    FontAwesomeIcons.smile,
    //FontAwesomeIcons.commentSlash,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _indiceSeleccionado = index;
        });
        print(_indiceSeleccionado);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _indiceSeleccionado == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _indiceSeleccionado == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size tamanho = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            SizedBox(height: tamanho.height * 0.02),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "CONSULTAS",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColorPrimario,
                    fontSize: 25),
              ),
            ),
            SvgPicture.asset(
              "assets/icons/pqrs.svg",
              height: tamanho.height * 0.25,
            ),
            SizedBox(height: 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            CarruselPreguntas(),
          ],
        ),
      ),
    );
  }
}
/*
final TextStyle textStyle = new TextStyle(fontSize: 28);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PQRS'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Bienvenido', style: textStyle),
          Text('Gestiona las PQRS', style: textStyle),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.account_box),
        onPressed: () {
          print('A cuenta');
        },
      ),
    );
  }
}
*/
