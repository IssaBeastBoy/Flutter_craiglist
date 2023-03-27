import 'package:dartz/dartz.dart';
import 'package:mobile/Features/user_login/domain/entities/authuser_request.dart';
import 'package:mobile/Features/user_login/domain/entities/authuser_response.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile/Features/user_login/domain/repositories/get_authuser_request_repo.dart';
import 'package:mobile/Features/user_login/domain/usecases/get_authuser_request.dart';

class MockAuthUser extends Mock implements AuthUserRepo {}

void main() {
  late GetAuthUser usecase;
  late MockAuthUser mockAuthUser;
  late final AuthUserResponse testResponse;
  late final testEmail;
  late final testpassword;
  late final testuserAuth;

  late final int status;
  late final Map<String, dynamic> body;
  late final String created;
  late final String message;

  setUp(() {
    mockAuthUser = MockAuthUser();
    usecase = GetAuthUser(mockAuthUser);
    testEmail = 'test@test.com';
    testpassword = '12345';
    testuserAuth = AuthUser(email: testEmail, password: testpassword);
    status = 200;
    body = {
      "_id": 1,
      "email": "test@test.com",
      "password": "12345",
      "name": "Thulani",
      "surname": "Tshabalala",
      "roles": {}
    };
    created = "2022-07-03 16:21:12.357246";
    message = "Success";
    testResponse = AuthUserResponse(
        status: status, body: body, created: created, message: message);
  });

  test(
    'should get user login request detail',
    () async {
      // arrange
      when(mockAuthUser.getAuthUser(testuserAuth))
          .thenAnswer((_) async => Right(testResponse));
      // act
      final result = await usecase(Params(requestEntity: testuserAuth));
      // assert
      expect(result, Right(testResponse));
      verify(mockAuthUser.getAuthUser(testuserAuth));
      verifyNoMoreInteractions(mockAuthUser);
    },
  );
}
