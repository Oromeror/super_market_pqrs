import 'dart:convert';

import 'package:http/http.dart' as http;

class PqrsProveedor {
  //final String _token = 'c5444adb729b9819ed91d3a7dc4b9117af9e48ac'; // Clave

  Future<Map<String, dynamic>> generarPqrs(String identificacion,
      String tipoRadicado, String comentario, String anexo) async {
    final pqrsData = {
      'identificacion': identificacion,
      'tipo_radicado': tipoRadicado,
      'comentario': comentario,
      'anexo': anexo,
    };

    var resp = await http.post(
      'https://pqrsbosque.com/pqr/crear/',
      headers: {"Content-Type": "application/json"},
      body: json.encode(pqrsData),
    );

    // if (resp.statusCode == 200) {
    //   print(resp.body);
    // } else {
    //   print('A network error occurred');
    // }

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if (decodedResp.containsKey('token')) {
      return {'ok': true, 'token': decodedResp['token']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }
}
