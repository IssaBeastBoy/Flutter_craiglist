import 'package:mobile/Features/register_user/domain/entities/register_user.dart';

class RegistrationRequest extends RegisterUser {
  final String password;
  final String email;
  final String name;
  final String surname;
  final Map<String, dynamic> roles;

  RegistrationRequest(
      {required this.password,
      required this.email,
      required this.name,
      required this.surname,
      required this.roles})
      : super(
            password: password,
            email: email,
            name: name,
            surname: surname,
            roles: roles);
}
