import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioProveedor {
  //final String _token = 'c5444adb729b9819ed91d3a7dc4b9117af9e48ac'; // Clave
  final String localUrl = 'http://10.0.2.2:8000';
  final String prodUrl = 'https://pqrsbosque.com';

  Future<Map<String, dynamic>> login(
      String identificacion, String password) async {
    final url = '$localUrl/cliente/login/';
    print(url);
    final loginData = {'identificacion': identificacion, 'password': password};

    var resp = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(loginData),
    );

    if (resp.statusCode == 200 || resp.statusCode == 201) {
      Map<String, dynamic> decodedResp = json.decode(resp.body);
      _imprimirRespDecoded(decodedResp.toString());

      if (decodedResp.containsKey('token')) {
        return {'ok': true, 'token': decodedResp['token']};
      } else {
        return {'ok': false, 'mensaje': decodedResp['error']['message']};
      }
    } else {
      throw Exception('No ha podido loguearse correctamente.');
    }
  }

  // ignore: missing_return
  Future<Map<String, dynamic>> nuevoUsuario(
      String usernames,
      String firstName,
      String lastName,
      String email,
      String telefono,
      String identificacion,
      String tipoIdentificacion) async {
    final url = '$localUrl/cliente/crear/';
    final newUserData = {
      'usernames': usernames,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'telefono': telefono,
      'identificacion': identificacion,
      'tipo_identificacion': tipoIdentificacion,
      'returnSecureToken': true
    };

    var resp = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(newUserData));

    // if (resp.statusCode == 200) {
    //   print(resp.body);
    // } else {
    //   print('A network error occurred');
    // }

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    _imprimirRespDecoded(decodedResp.toString());

    if (decodedResp.toString().contains('fecha')) {
      return {'ok': true, 'token': decodedResp['token']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  _imprimirRespDecoded(String decResp) {
    return print('Server decoded response: ' + decResp);
  }
}
