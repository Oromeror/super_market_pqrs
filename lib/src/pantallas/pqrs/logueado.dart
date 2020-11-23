import 'package:flutter/material.dart';
import 'package:super_market_pqrs/src/pantallas/ayuda/pantalla_ayuda.dart';
import 'package:super_market_pqrs/src/pantallas/pqrs/componentes/pqrs_usuario.dart';

class UsuarioLogueado extends StatefulWidget {
  @override
  _LoguedScreenState createState() => _LoguedScreenState();
}

class _LoguedScreenState extends State<UsuarioLogueado> {
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _obtenerCuerpo(indice),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (valor) => setState(() => indice = valor),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.portrait_sharp,
              size: 30.0,
            ),
            label: 'Pqrs',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help_sharp,
              size: 30.0,
            ),
            label: 'Ayuda',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _obtenerCuerpo(int indice) {
    switch (indice) {
      case 0:
        return PqrsUsuario();
      case 1:
        return PantallaAyuda();
    }

    return Center(
      child: Text("Ups. Un error ha sucedido."),
    );
  }
}
