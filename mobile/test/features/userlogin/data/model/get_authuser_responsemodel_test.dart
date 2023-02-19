import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/Features/user_login/data/models/AuthUserRequestModel.dart';
import 'package:mobile/Features/user_login/data/models/AuthUserResponseModel.dart';
import 'package:mobile/Features/user_login/domain/entities/authuser_response.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../domain/usercases/get_authuser_response_test.dart';

void main() {
  final int status = 200;
  final Map<String, dynamic> body = {
    "_id": 1,
    "email": "test@test.com",
    "password": "12345",
    "name": "Thulani",
    "surname": "Tshabalala",
    "roles": {}
  };
  final String timestamp = "2022-07-03 16:21:12.357246";
  final String message = "Success";
  final tAuthUserResponseModel =
      AuthUserResponseModel(status, body, timestamp, message);

  test("should be a subclass of the Authenticate User Response entity", () {
    expect(tAuthUserResponseModel, isA<AuthUserResponse>());
  });

  test("should be a valid User Authentication JSON response", () async {
    // arrange
    final Map<String, dynamic> requestMap =
        json.decode(fixture("user_login/authuser_response.json"));
    // act
    final result = AuthUserResponseModel.fromJSON(requestMap);
    // assert
    expect(result, tAuthUserResponseModel);
  });
}
