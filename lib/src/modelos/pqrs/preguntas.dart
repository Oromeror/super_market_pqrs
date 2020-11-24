import 'package:super_market_pqrs/src/modelos/pqrs/pqrs.dart';

class Pregunta {
  List<Pqrs> preguntas;

  Pregunta({this.preguntas});
}

List<Pqrs> preguntas = [
  Pqrs(
      number: 1,
      date: new DateTime.now(),
      type: 'Pregunta',
      comments: '¿Cuando llegará mi pedido?',
      attachments: null,
      status: 'Nuevo',
      substantiation: 'Su solicitud está en proceso.'),
  Pqrs(
      number: 2,
      date: new DateTime.now(),
      type: 'Pregunta',
      comments:
          '¿Cómo funciona la política de reembolsos?, quisiera cancelar mi pedido',
      attachments: null,
      status: 'Nuevo',
      substantiation: 'Sin comentarios aún.'),
  Pqrs(
      number: 3,
      date: new DateTime.now(),
      type: 'Pregunta',
      comments: '¿Cuando llegará mi pedido 3.0?',
      attachments: null,
      status: 'Nuevo',
      substantiation: 'Sin comentarios aún.'),
];
