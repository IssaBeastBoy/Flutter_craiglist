import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/Features/register_user/data/models/register_request.dart';
import 'package:mobile/Features/register_user/domain/entities/register_user.dart';

void main() {
  final String password = '12345';
  final String email = 'test@test.com';
  final String name = 'Thulani';
  final String surname = "Tshabalala";
  final Map<String, dynamic> roles = {};
  final tRegisterRequest = RegistrationRequest(
      password: password,
      email: email,
      name: name,
      surname: surname,
      roles: roles);

  test("should be subclass of Register user entity", () async {
    expect(tRegisterRequest, isA<RegisterUser>());
  });
}
