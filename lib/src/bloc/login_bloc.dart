import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:super_market_pqrs/src/bloc/validadores.dart';

class LoginBloc with Validadores {
  final _usernamesController = BehaviorSubject<String>();
  final _firstNameController = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _telefonoController = BehaviorSubject<String>();
  final _identificacionController = BehaviorSubject<String>();
  final _tipoIdentificacioControllern = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get usernamesStream =>
      _usernamesController.stream.transform(validarUsernames);
  Stream<String> get firstNameStream =>
      _firstNameController.stream.transform(validarFirstName);
  Stream<String> get lastNameStream =>
      _lastNameController.stream.transform(validarLastName);
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get telefonoStream =>
      _telefonoController.stream.transform(validarTelefono);
  Stream<String> get identificacionStream =>
      _identificacionController.stream.transform(validarIdentificacion);
  Stream<String> get tipoIdStream =>
      _tipoIdentificacioControllern.stream.transform(validarTipoId);

  Stream<bool> get formValidStream => Observable.combineLatest7(
      usernamesStream,
      firstNameStream,
      lastNameStream,
      emailStream,
      telefonoStream,
      identificacionStream,
      tipoIdStream,
      (a, b, c, d, e, f, g) => true);

  // Insertar valores al Stream
  Function(String) get changeUsernames => _usernamesController.sink.add;
  Function(String) get changeFirstName => _firstNameController.sink.add;
  Function(String) get changeLastName => _lastNameController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeTelefono => _telefonoController.sink.add;
  Function(String) get changeIdentificacion =>
      _identificacionController.sink.add;
  Function(String) get changeTipoIdentificacion =>
      _tipoIdentificacioControllern.sink.add;

  // Obtener el último valor ingresado a los streams
  String get usernames => _usernamesController.value;
  String get firstName => _firstNameController.value;
  String get lastName => _lastNameController.value;
  String get email => _emailController.value;
  String get telefono => _telefonoController.value;
  String get identificacion => _identificacionController.value;
  String get tipoIdentificacion => _tipoIdentificacioControllern.value;

  String get password => null;

  dispose() {
    _usernamesController?.close();
    _firstNameController?.close();
    _lastNameController.close();
    _emailController.close();
    _telefonoController.close();
    _identificacionController.close();
    _tipoIdentificacioControllern.close();
  }
}
