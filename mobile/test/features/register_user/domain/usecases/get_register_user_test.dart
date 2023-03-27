import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/Features/register_user/domain/entities/register_user_request.dart';
import 'package:mobile/Features/register_user/domain/entities/register_user_response.dart';
import 'package:mobile/Features/register_user/domain/repositories/get_register_user_request_repo.dart';
import 'package:mobile/Features/register_user/domain/usecases/get_register_user_request.dart';
import 'package:mockito/mockito.dart';

class MockRegisterUser extends Mock implements RegisterUserRepo {}

void main() {
  late final GetRegisterUser usecase;
  late final MockRegisterUser mockRegisterUder;
  late final String password;
  late final String email;
  late final String name;
  late final String surname;
  late final Map<String, dynamic> roles;
  late final RegisterUser testRegisterUser;
  late final RegistrationResponse testRegisterRespons;
  late final int status;
  late final Map<String, dynamic> body;
  late final String timestamp;
  late final String message;

  setUp(() {
    mockRegisterUder = MockRegisterUser();
    usecase = GetRegisterUser(mockRegisterUder);
    password = '12345';
    email = 'test@test.com';
    name = 'Thulani';
    surname = "Tshabalala";
    roles = {};
    testRegisterUser = RegisterUser(
        password: password,
        email: email,
        name: name,
        surname: surname,
        roles: roles);
    status = 200;
    body = {"_id": 1};
    timestamp = "2022-07-03 16:21:12.357246";
    message = "Success";

    testRegisterRespons = RegistrationResponse(
        status: status, body: body, timestamp: timestamp, message: message);
  });

  test("should get user registration details", () async {
    // arrange
    when(mockRegisterUder.getRegisterUser(
            testRegisterUser))
        .thenAnswer((_) async => Right(testRegisterRespons));
    // act
    final result = await usecase(Params(registerUser: testRegisterUser));
    // assert
    expect(result, Right(testRegisterRespons));
    verify(mockRegisterUder.getRegisterUser(testRegisterUser));
    verifyNoMoreInteractions(mockRegisterUder);
  });
}
