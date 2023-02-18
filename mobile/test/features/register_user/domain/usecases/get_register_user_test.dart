import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/Features/register_user/domain/entities/register_user.dart';
import 'package:mobile/Features/register_user/domain/repositories/get_register_userrepo.dart';
import 'package:mobile/Features/register_user/domain/usecases/get_register_user.dart';
import 'package:mobile/Features/user_login/presentation/widgets/userlogin.dart';
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
  late final testRegisterUser;

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
  });

  test("should get user registration details", () async {
    // arrange
    when(mockRegisterUder.getRegisterUder(
            password, email, name, surname, roles))
        .thenAnswer((_) async => Right(testRegisterUser));
    // act
    final result = await usecase(Params(
        email: email,
        password: password,
        name: name,
        surname: surname,
        roles: roles));
    // assert
    expect(result, Right(testRegisterUser));
    verify(mockRegisterUder.getRegisterUder(
        password, email, name, surname, roles));
    verifyNoMoreInteractions(mockRegisterUder);
  });
}
