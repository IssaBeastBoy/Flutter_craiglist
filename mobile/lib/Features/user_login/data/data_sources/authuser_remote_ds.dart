import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/authuser_request.dart';
import '../../domain/entities/authuser_response.dart';
import '../models/AuthUserRequestModel.dart';
import '../models/AuthUserResponseModel.dart';

abstract class AuthUserRemoteDS {
  ///Calls the http://{{servername:port}}/api/v1/login endpoint
  ///
  ///Will throw a [ServerException] for all errors
  Future<AuthUserResponse>? getAuthUserInfo(AuthUser requestModel);
}

class AuthUserRemoteDSImpl implements AuthUserRemoteDS {
  final http.Client client;

  AuthUserRemoteDSImpl({required this.client});

  @override
  Future<AuthUserResponse>? getAuthUserInfo(AuthUser requestModel) async {
    final url = Uri.parse("http://127.0.0.1:8000/api/v1/login");
    final body = json.encode({
      "email": requestModel.email,
      "password": requestModel.password,
    });
    // TODO: implement getAuthUser
    final response = await client.post(url, body: body, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    return AuthUserResponseModel.fromJSON(json.decode(response.body));
  }
}
