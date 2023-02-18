import 'package:equatable/equatable.dart';

class RegisterUser extends Equatable {
  final String password;
  final String email;
  final String name;
  final String surname;
  final Map<String, dynamic> roles;

  RegisterUser(
      {required this.password,
      required this.email,
      required this.name,
      required this.surname,
      required this.roles});

  @override
  // TODO: implement props
  List<Object?> get props => [password, email, name, surname, roles];
}
