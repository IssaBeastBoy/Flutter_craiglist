import 'package:dartz/dartz.dart';
import 'package:mobile/Features/user_login/domain/entities/authuser.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile/Features/user_login/domain/repositories/get_authuser_repo.dart';
import 'package:mobile/Features/user_login/domain/usecases/get_authuser.dart';

class MockAuthUser extends Mock implements AuthUserRepo {}

void main() {
  late GetAuthUser usecase;
  late MockAuthUser mockAuthUser;
  late final testEmail;
  late final testpassword;
  late final testuserAuth;

  setUp(() {
    mockAuthUser = MockAuthUser();
    usecase = GetAuthUser(mockAuthUser);
    testEmail = 'test@test.com';
    testpassword = '12345';
    testuserAuth = AuthUser(email: testEmail, password: testpassword);
  });

  test(
    'should get use email and address',
    () async {
      // arrange
      when(mockAuthUser.getAuthUser(testEmail, testpassword))
          .thenAnswer((_) async => Right(testuserAuth));
      // act
      final result =
          await usecase(Params(email: testEmail, password: testpassword));
      // assert
      expect(result, Right(testuserAuth));
      verify(mockAuthUser.getAuthUser(testEmail, testpassword));
      verifyNoMoreInteractions(mockAuthUser);
    },
  );
}
