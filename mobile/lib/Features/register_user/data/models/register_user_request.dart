import 'package:mobile/Features/register_user/domain/entities/register_user_request.dart';

class RegistrationRequestModel extends RegisterUser {
  final String password;
  final String email;
  final String name;
  final String surname;
  final Map<String, dynamic> roles;

  RegistrationRequestModel(
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

  factory RegistrationRequestModel.fromJSON(Map<String, dynamic> request) {
    return RegistrationRequestModel(
        password: request['password'],
        email: request["email"],
        name: request["name"],
        surname: request["surname"],
        roles: request["roles"]);
  }
}
