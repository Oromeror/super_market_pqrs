class Identificacion {
  int id;
  String nombre;

  Identificacion(this.id, this.nombre);

  static List<Identificacion> obtenerIdentificacion() {
    return <Identificacion>[
      Identificacion(1, 'Documento de identidad'),
      Identificacion(2, 'Cédula'),
      Identificacion(3, 'Cédulta de extranjería'),
      Identificacion(4, 'Pasaporte'),
    ];
  }
}
