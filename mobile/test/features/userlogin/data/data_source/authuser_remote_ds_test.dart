import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/Features/user_login/data/data_sources/authuser_remote_ds.dart';
import 'package:mobile/Features/user_login/data/models/AuthUserRequestModel.dart';
import 'package:mobile/Features/user_login/data/models/AuthUserResponseModel.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late final AuthUserRemoteDSImpl datasource;
  late final mockHttpClient;
  late final AuthUserRequestModel requestModel;
  late final AuthUserResponseModel testResponseModel;
  late String password;
  late String email;
  late final int status;
  late final Map<String, dynamic> body;
  late final String created;
  late final String message;

  setUp(() {
    email = 'test@test.com';
    password = '12345';
    status = 200;
    body = {
      "_id": "63d00851a8db1f36ad8631ee",
      "email": "test@test.com",
      "password": "12345",
      "name": "Litha",
      "surname": "Hashe",
      "gender": "Female",
      "roles": {}
    };
    created = "17 November 1995";
    message = "Success";
    mockHttpClient = http.Client();
    datasource = AuthUserRemoteDSImpl(client: mockHttpClient);
    requestModel = AuthUserRequestModel(email, password);
    testResponseModel = AuthUserResponseModel(status, body, created, message);
  });

  test("should perform URL request to the user authenticate url", () async {
    // arrange
    final url = Uri.parse("http://127.0.0.1:8000/api/v1/login");
    final jsonRequest =
        json.encode(fixture("user_login/authuser_response.json"));
    // when(datasource.getAuthUserInfo(requestModel))
    //     .thenAnswer((_) async => responseModel);
    // act
    final response = await datasource.getAuthUserInfo(requestModel);
    // assert
    expect(testResponseModel, response);
  });
}
