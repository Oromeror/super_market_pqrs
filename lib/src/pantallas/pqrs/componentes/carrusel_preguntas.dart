import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_market_pqrs/constantes.dart';
import 'package:super_market_pqrs/src/modelos/pqrs/pqrs.dart';
import 'package:super_market_pqrs/src/modelos/pqrs/preguntas.dart';

class CarruselPreguntas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Preguntas',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              /*GestureDetector(
                onTap: () => print('Ver todas las preguntas'),
                child: Text(
                  '', //ver todo,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),*/
            ],
          ),
        ),
        Container(
          height: 500.0,
          color: Colors.green.shade50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: preguntas.length,
            itemBuilder: (BuildContext context, int index) {
              Pqrs pregunta = preguntas[index];
              return Container(
                margin: EdgeInsets.all(10.0),
                width: 210.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                        height: 470.0,
                        width: 202.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${pregunta.status.characters.toString()}',
                                style: TextStyle(
                                  fontSize: 29.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                  color: kColorPrimario,
                                ),
                              ),
                              Text(
                                '${'\nTicket #' + pregunta.number.toString()}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              Text(
                                '${'\nComentario: \n\n' + pregunta.comments}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
