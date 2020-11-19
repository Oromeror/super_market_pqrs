class Pqrs {
  int number;
  DateTime date;
  String type;
  String comments;
  List<Object> attachments;
  String status;
  String substantiation;

  Pqrs({
    this.number,
    this.date,
    this.type,
    this.comments,
    this.attachments,
    this.status,
    this.substantiation,
  });
}

List<Pqrs> pqrs = [
  Pqrs(
      number: 1,
      date: new DateTime.now(),
      type: 'Pregunta',
      comments: '¿Cuando llegará mi pedido?',
      attachments: null,
      status: 'Nuevo',
      substantiation: 'Sin comentarios aún.'),
  Pqrs(
      number: 2,
      date: new DateTime.now(),
      type: 'Pregunta',
      comments: '¿Cuando llegará mi pedido 2.0?',
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
