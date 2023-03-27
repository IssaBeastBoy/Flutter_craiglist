import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/Features/user_login/data/data_sources/authuser_remote_ds.dart';
import 'package:mobile/Features/user_login/data/models/AuthUserRequestModel.dart';
import 'package:mobile/Features/user_login/data/repositories/authuser_request_repo_impl.dart';
import 'package:mobile/Features/user_login/domain/entities/authuser_request.dart';
import 'package:mockito/mockito.dart';

class MockAuthUserRemoteDS extends Mock implements AuthUserRemoteDS {}

void main() {
  late MockAuthUserRemoteDS mockAuthUserRemoteDS;
  late AuthUserRequestImplementation repository;
  late final testEmail;
  late final testpassword;
  late final testAuthUserModel;
  late AuthUser authUser;
  late AuthUserRequestModel requestModel;

  setUp(() async {
    mockAuthUserRemoteDS = MockAuthUserRemoteDS();
    repository =
        AuthUserRequestImplementation(authUserRemoteDS: mockAuthUserRemoteDS);
    testEmail = 'test@test.com';
    testpassword = '12345';
    testAuthUserModel = AuthUserRequestModel(testEmail, testpassword);
    authUser = await testAuthUserModel;
  });

  test(
      'should return data from endpoint when a call to the authenticate user endpoint is made.',
      () async {
    // arrange
    when(mockAuthUserRemoteDS.getAuthUserInfo(testAuthUserModel))
        .thenAnswer((_) async => testAuthUserModel);
    // act
    final result = await repository.getAuthUser(testAuthUserModel);
    // assert
    verify(mockAuthUserRemoteDS.getAuthUserInfo(testAuthUserModel));
    expect(result, Right(authUser));
  });
}
