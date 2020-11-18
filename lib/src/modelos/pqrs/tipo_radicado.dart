class TipoRadicado {
  int id;
  String nombre;

  TipoRadicado(this.id, this.nombre);

  static List<TipoRadicado> obtenerTipoRadicado() {
    return <TipoRadicado>[
      TipoRadicado(1, 'Pregunta'),
      TipoRadicado(2, 'Queja'),
      TipoRadicado(3, 'Reclamo'),
    ];
  }
}
