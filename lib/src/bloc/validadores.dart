import 'dart:async';

class Validadores {
  final validarUsernames = StreamTransformer<String, String>.fromHandlers(
      handleData: (usernames, sink) {
    if (usernames.isNotEmpty) {
      sink.add(usernames);
    } else {
      sink.addError('Ingrese un Username.');
    }
  });

  final validarFirstName = StreamTransformer<String, String>.fromHandlers(
      handleData: (firstName, sink) {
    if (firstName.isNotEmpty) {
      sink.add(firstName);
    } else {
      sink.addError('Ingrese un nombre.');
    }
  });

  final validarLastName = StreamTransformer<String, String>.fromHandlers(
      handleData: (lasttName, sink) {
    if (lasttName.isNotEmpty) {
      sink.add(lasttName);
    } else {
      sink.addError('Ingrese un apellido.');
    }
  });

  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no es correcto');
    }
  });

  final validarTelefono = StreamTransformer<String, String>.fromHandlers(
      handleData: (telefono, sink) {
    if (telefono.toString().length < 10) {
      sink.add(telefono.toString());
    } else {
      sink.addError('Ingrese un teléfono valido.');
    }
  });

  final validarIdentificacion = StreamTransformer<String, String>.fromHandlers(
      handleData: (identificacion, sink) {
    if (!identificacion.isNotEmpty) {
      sink.add(identificacion);
    } else {
      sink.addError('Ingrese una identificación por favor.');
    }
  });

  final validarTipoId = StreamTransformer<String, String>.fromHandlers(
      handleData: (tipoId, sink) {
    if (tipoId.isNotEmpty) {
      sink.add(tipoId);
    } else {
      sink.addError('Seleccion el tipo de identificación');
    }
  });
}
