class Identificacion {
  int id;
  String nombre;

  Identificacion(this.id, this.nombre);

  static List<Identificacion> obtenerIdentificacion() {
    return <Identificacion>[
      Identificacion(1, 'CC'),
      Identificacion(2, 'C. Extranjeria'),
      Identificacion(3, 'Pasaporte')
    ];
  }
}
