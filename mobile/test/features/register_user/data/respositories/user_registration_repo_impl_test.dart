import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/Features/register_user/data/data_sources/register_user_remote_ds.dart';
import 'package:mobile/Features/register_user/data/models/register_user_request.dart';
import 'package:mobile/Features/register_user/data/repositories/user_registration_repo_imp.dart';
import 'package:mobile/Features/register_user/domain/entities/register_user_request.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDS extends Mock implements RegisterUserRemoteDS {}

void main() {
  late UserRegistrationRepoImplementation repository;

  late MockRemoteDS mockRemoteDS;
  late final tRegisterUserModel;
  late RegisterUser registerUser;
  final String password = '12345';
  final String email = 'test@test.com';
  final String name = 'Thulani';
  final String surname = "Tshabalala";
  final Map<String, dynamic> roles = {};
  setUp(() async {
    mockRemoteDS = MockRemoteDS();
    repository = UserRegistrationRepoImplementation(remoteDS: mockRemoteDS);
    tRegisterUserModel = RegistrationRequestModel(
        password: password,
        email: email,
        name: name,
        surname: surname,
        roles: roles);
    registerUser = await tRegisterUserModel;
  });
  test("should return data from endpoint when a call to the endpoint is made.",
      () async {
    // arrange
    when(mockRemoteDS.getRegisterUser(password, email, name, surname, roles))
        .thenAnswer((_) async => tRegisterUserModel);
    // act
    final result =
        await repository.getRegisterUser(password, email, name, surname, roles);
    //assert
    verify(mockRemoteDS.getRegisterUser(password, email, name, surname, roles));
    expect(result, Right(registerUser));
  });
}
