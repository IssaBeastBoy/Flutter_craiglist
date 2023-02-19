import '../models/register_user_request.dart';

abstract class RegisterUserRemoteDS {
  ///Calls the http://{{servername:port}}/api/v1/register endpoint
  ///
  ///Will throw a [ServerException] for all errors
  Future<RegistrationRequestModel>? getRegisterUser(String password,
      String email, String name, String surname, Map<String, dynamic> roles);
}
