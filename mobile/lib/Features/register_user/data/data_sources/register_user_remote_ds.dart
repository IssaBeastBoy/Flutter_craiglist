import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/register_user_request.dart';
import '../../domain/entities/register_user_response.dart';
import '../models/register_user_request.dart';
import '../models/user_registration_response.dart';

abstract class RegisterUserRemoteDS {
  ///Calls the http://{{servername:port}}/api/v1/register endpoint
  ///
  ///Will throw a [ServerException] for all errors
  Future<RegistrationResponse>? getRegisterUserResponse(
      RegisterUser requestModel);
}

class RegisterUserRemoteDSImpl implements RegisterUserRemoteDS {
  final http.Client client;

  RegisterUserRemoteDSImpl({required this.client});

  @override
  Future<RegistrationResponse>? getRegisterUserResponse(
      RegisterUser requestModel) async {
    final url = Uri.parse("http://10.0.2.2:8000/api/v1/register");
    final body = json.encode({
      "email": requestModel.email,
      "password": requestModel.password,
      "name": requestModel.name,
      "surname": requestModel.surname,
      "roles": requestModel.roles
    });
    // TODO: implement getRegisterUser
    final response = await client.post(url, body: body);
    return UserRegistrationResponseModel.fromJSON(json.decode(response.body));
  }
}
