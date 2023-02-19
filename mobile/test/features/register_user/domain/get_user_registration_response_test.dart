import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/Features/register_user/domain/entities/register_user_response.dart';
import 'package:mobile/Features/register_user/domain/repositories/get_user_registration_responserepo.dart';
import 'package:mobile/Features/register_user/domain/usecases/get_user_registration_response.dart';
import 'package:mockito/mockito.dart';

class MockUserRegistrationResponse extends Mock
    implements RegistrationResponseRepo {}

void main() {
  late final MockUserRegistrationResponse mockUserRegistrationResponse;
  late GetUserRegistrationResponse usecase;
  late final int status;
  late final Map<String, dynamic> body;
  late final String timestamp;
  late final String message;
  late final tRegistrationResponse;

  setUp(() {
    mockUserRegistrationResponse = MockUserRegistrationResponse();
    status = 400;
    body = {"_id": 1};
    timestamp = "2022-07-03 16:21:12.357246";
    message = "Success";
    usecase = GetUserRegistrationResponse(mockUserRegistrationResponse);
    tRegistrationResponse = RegistrationResponse(
        status: status, body: body, timestamp: timestamp, message: message);
  });

  test("should get the correct user registration details", () async {
    // arrange
    when(mockUserRegistrationResponse.getRegistrationResponse(
            status, body, timestamp, message))
        .thenAnswer((_) async => Right(tRegistrationResponse));
    // act
    final result = await usecase(Params(
        status: status, body: body, timestamp: timestamp, message: message));
    // assert
    expect(result, Right(tRegistrationResponse));
    verify(mockUserRegistrationResponse.getRegistrationResponse(
        status, body, timestamp, message));
    verifyNoMoreInteractions(mockUserRegistrationResponse);
  });
}
