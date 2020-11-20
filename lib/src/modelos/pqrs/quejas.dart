import 'package:super_market_pqrs/src/modelos/pqrs/pqrs.dart';

class Quejas {
  List<Pqrs> quejas;

  Quejas({this.quejas});
}

List<Pqrs> quejas = [
  Pqrs(
      number: 4,
      date: new DateTime.now(),
      type: 'Queja',
      comments: 'Queja 1',
      attachments: null,
      status: 'Nuevo',
      substantiation: 'Sin comentarios aún.'),
  Pqrs(
      number: 5,
      date: new DateTime.now(),
      type: 'Queja',
      comments: 'Queja 2',
      attachments: null,
      status: 'Nuevo',
      substantiation: 'Sin comentarios aún.'),
  Pqrs(
      number: 6,
      date: new DateTime.now(),
      type: 'Queja',
      comments: 'Queja 3',
      attachments: null,
      status: 'Nuevo',
      substantiation: 'Sin comentarios aún.'),
];
