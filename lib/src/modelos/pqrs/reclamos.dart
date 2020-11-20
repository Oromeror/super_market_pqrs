import 'package:super_market_pqrs/src/modelos/pqrs/pqrs.dart';

class Quejas {
  List<Pqrs> reclamos;

  Quejas({this.reclamos});
}

List<Pqrs> reclamos = [
  Pqrs(
      number: 7,
      date: new DateTime.now(),
      type: 'Reclamo',
      comments: 'Reclamo 1',
      attachments: null,
      status: 'Nuevo',
      substantiation: 'Sin comentarios aún.'),
  Pqrs(
      number: 8,
      date: new DateTime.now(),
      type: 'Reclamo',
      comments: 'Reclamo 2',
      attachments: null,
      status: 'Nuevo',
      substantiation: 'Sin comentarios aún.'),
  Pqrs(
      number: 9,
      date: new DateTime.now(),
      type: 'Reclamo',
      comments: 'Reclamo 3',
      attachments: null,
      status: 'Nuevo',
      substantiation: 'Sin comentarios aún.'),
];
