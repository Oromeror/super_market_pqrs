import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioProveedor {
  final String _token = 'c5444adb729b9819ed91d3a7dc4b9117af9e48ac'; // Clave

  Future<Map<String, dynamic>> login(
      String identificacion, String password) async {
    final authData = {
      'identificacion': identificacion,
      'password': password,
      'returnSecureToken': true
    };

    var resp = await http.post('http://localhost:8000/cliente/login/',
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData));
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if (decodedResp.containsKey('token')) {
      return {'ok': true, 'token': decodedResp['token']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(
      String usernames,
      String firstName,
      String lastName,
      String email,
      String telefono,
      String identificacion,
      String tipoIdentificacion) async {
    final authData = {
      'usernames': usernames,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'telefono': telefono,
      'identificacion': identificacion,
      'tipo_identificacion': tipoIdentificacion,
      'returnSecureToken': true
    };

    var resp = await http.post('http://localhost:8000/cliente/crear/',
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData));
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if (decodedResp.containsKey('token')) {
      return {'ok': true, 'token': decodedResp['token']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }
}
