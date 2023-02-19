import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/Features/register_user/data/models/register_user_request.dart';
import 'package:mobile/Features/register_user/domain/entities/register_user_request.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final String password = '12345';
  final String email = 'test@test.com';
  final String name = 'Thulani';
  final String surname = "Tshabalala";
  final Map<String, dynamic> roles = {};
  final tRegisterRequest = RegistrationRequest(
      password: password,
      email: email,
      name: name,
      surname: surname,
      roles: roles);

  test("should be subclass of Register user entity", () async {
    expect(tRegisterRequest, isA<RegisterUser>());
  });

  test("should return valid user registration JSON request model", () async {
    // arrange
    final Map<String, dynamic> requestMap =
        json.decode(fixture("register_user/registeruser_request.json"));
    // act
    final result = RegistrationRequest.fromJSON(requestMap);
    // assert
    expect(result, tRegisterRequest);
  });
}
