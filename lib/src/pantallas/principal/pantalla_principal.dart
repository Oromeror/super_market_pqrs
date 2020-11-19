import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:super_market_pqrs/src/pantallas/Bienvenida/bienvenida.dart';
import 'package:super_market_pqrs/src/pantallas/pqrs/pantalla_ayuda.dart';

class PantallaPrincipal extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PantallaPrincipal> {
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
              Icons.help_sharp,
              size: 30.0,
            ),
            label: 'Ayuda',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.portrait_sharp,
              size: 30.0,
            ),
            label: 'Perfil',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _obtenerCuerpo(int indice) {
    switch (indice) {
      case 0:
        return PantallaAyuda();
      case 1:
        return Bienvenida();
    }

    return Center(
      child: Text("Ups. Un error ha sucedido."),
    );
  }
}
/*
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'PQRS App',
                style: TextStyle(
                  fontSize: 29.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help_center,
              size: 30.0,
            ),
            title: Text('Ayuda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo,
              size: 30.0,
            ),
            title: Text('Perfil'),
          ),
        ],
      ),
    );
  }
}*/
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
