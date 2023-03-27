import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/Features/register_user/data/data_sources/register_user_remote_ds.dart';
import 'package:mobile/Features/register_user/data/models/register_user_request.dart';
import 'package:mobile/Features/register_user/data/models/user_registration_response.dart';
import 'package:mobile/Features/register_user/data/repositories/user_registration_repo_imp.dart';
import 'package:mobile/Features/register_user/domain/entities/register_user_request.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDS extends Mock implements RegisterUserRemoteDS {}

void main() {
  late UserRegistrationRepoImplementation repository;

  late MockRemoteDS mockRemoteDS;
  late RegisterUser registerUser;
  late final RegistrationRequestModel tRegisterUserModel;
  late final UserRegistrationResponseModel responseModel;
  final String password = '12345';
  final String email = 'test@test.com';
  final String name = 'Thulani';
  final String surname = "Tshabalala";
  final Map<String, dynamic> roles = {};
  late final int status;
  late final Map<String, dynamic> body;
  late final String timestamp;
  late final String message;
  setUp(() async {
    mockRemoteDS = MockRemoteDS();
    repository = UserRegistrationRepoImplementation(remoteDS: mockRemoteDS);
    status = 200;
    body = {"_id": 1};
    timestamp = "2022-07-03 16:21:12.357246";
    message = "Success";
    tRegisterUserModel = RegistrationRequestModel(
        password: password,
        email: email,
        name: name,
        surname: surname,
        roles: roles);
    registerUser = tRegisterUserModel;
    responseModel =
        UserRegistrationResponseModel(status, body, timestamp, message);
  });
  test(
      "should return data from endpoint when a call to the register user endpoint is made.",
      () async {
    // arrange
    when(mockRemoteDS.getRegisterUserResponse(tRegisterUserModel))
        .thenAnswer((_) async => responseModel);
    // act
    final result =
        await repository.getRegisterUser(tRegisterUserModel);
    //assert
    verify(mockRemoteDS.getRegisterUserResponse(tRegisterUserModel));
    expect(result, Right(responseModel));
  });
}
