import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/Features/register_user/domain/entities/register_user_response.dart';
import 'package:mobile/Features/register_user/data/models/user_registration_response.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final int status = 200;
  final Map<String, dynamic> body = {"_id": 1};
  final String timestamp = "2022-07-03 16:21:12.357246";
  final String message = "Success";
  final tUserRegistrationResponse =
      UserRegistrationResponseModel(status, body, timestamp, message);

  test("should be a subclass of the User Registration status entity", () {
    expect(tUserRegistrationResponse, isA<RegistrationResponse>());
  });

  test("should return valid user registration JSON status model", () async {
    // arrange
    final Map<String, dynamic> requestMap =
        json.decode(fixture("register_user/registeruser_response.json"));
    // act
    final result = UserRegistrationResponseModel.fromJSON(requestMap);
    // assert
    expect(result, tUserRegistrationResponse);
  });
}
