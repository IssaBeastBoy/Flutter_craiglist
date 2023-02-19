import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/Features/user_login/data/models/AuthUserRequestModel.dart';
import 'package:mobile/Features/user_login/domain/entities/authuser_request.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final String email = "test@test.com";
  final String password = "12345";
  final tAuthUserRequestModel = AuthUserRequestModel(email, password);

  test("should be a subclass of the Authenicate User Request Model entity", () {
    expect(tAuthUserRequestModel, isA<AuthUser>());
  });

  test("should get valid authenticate user request JSON model", () async {
    // arrange
    final Map<String, dynamic> requestMap =
        json.decode(fixture("user_login/authuser_request.json"));
    // act
    final result = AuthUserRequestModel.fromJSON(requestMap);
    // assert
    expect(result, tAuthUserRequestModel);
  });
}
