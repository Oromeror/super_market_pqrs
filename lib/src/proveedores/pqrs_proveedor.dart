import 'dart:convert';

import 'package:http/http.dart' as http;

class PqrsProveedor {
  //final String _token = 'c5444adb729b9819ed91d3a7dc4b9117af9e48ac'; // Clave
  final String localUrl = 'http://10.0.2.2:8000';
  final String prodUrl = 'https://pqrsbosque.com';

  Future<Map<String, dynamic>> generarPqrs(String identificacion,
      String tipoRadicado, String comentario, String anexo) async {
    final url = '$localUrl/pqr/crear/';
    final pqrsData = {
      'identificacion': identificacion,
      'tipo_radicado': tipoRadicado,
      'comentario': comentario,
      'anexo': anexo,
    };

    var resp = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(pqrsData),
    );
    //  try {
    if (resp.statusCode == 200 || resp.statusCode == 201) {
      Map<String, dynamic> decodedResp = json.decode(resp.body);
      _imprimirRespDecoded(decodedResp.toString());
      return {'response': true};
    } else {
      return {'response': false};
    }
    // } catch (e) {
    //   print('A network error occurred, wasn´t possible to create a pqrs.');
    // }
  }

  _imprimirRespDecoded(String decResp) {
    return print('Server decoded response: ' + decResp);
  }
}
