import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/Features/register_user/data/data_sources/register_user_remote_ds.dart';
import 'package:mobile/Features/register_user/data/models/register_user_request.dart';
import 'package:mobile/Features/register_user/data/models/user_registration_response.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late final RegisterUserRemoteDSImpl datasource;
  late final MockHttpClient mockHttpClient;
  late final RegistrationRequestModel requestModel;
  final String password = '12345';
  final String email = 'test@test.com';
  final String name = 'Thulani';
  final String surname = "Tshabalala";
  final Map<String, dynamic> roles = {};

  setUp(() {
    mockHttpClient = MockHttpClient();
    datasource = RegisterUserRemoteDSImpl(client: mockHttpClient);
    requestModel = RegistrationRequestModel(
        password: password,
        email: email,
        name: name,
        surname: surname,
        roles: roles);
  });

  final url = Uri.parse("http://127.0.0.1:8000/api/v1/register");
  final tRegisterUserModel = UserRegistrationResponseModel.fromJSON(
      json.decode(fixture("register_user/registeruser_response.json")));
  test("should perform URL request to the user authenticate url", () async {
    // arrange
    when(mockHttpClient.get(url, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
            fixture("register_user/registeruser_response.json"), 200));
    // act
    datasource.getRegisterUserResponse(requestModel);
    // assert
    verify(mockHttpClient.get(url));
  });
  test("should get user registration response if response is 200", () async {
    // arrange
    when(mockHttpClient.get(url, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
            fixture("register_user/registeruser_response.json"), 200));
    // act
    final result = await datasource.getRegisterUserResponse(requestModel);
    // assert
    expect(result, tRegisterUserModel);
  });
}
