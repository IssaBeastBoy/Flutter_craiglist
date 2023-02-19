import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/Features/user_login/domain/entities/authuser_response.dart';
import 'package:mobile/Features/user_login/domain/repositories/get_authuser_response_repo.dart';
import 'package:mobile/Features/user_login/domain/usecases/get_authuser_response.dart';
import 'package:mockito/mockito.dart';

class AuthUserResponseMock extends Mock implements AuthUserResponseRepo {}

void main() {
  late final AuthUserResponseMock authUserResponseMock;
  late final GetAuthUserResponse usecase;
  late final int status;
  late final Map<String, dynamic> body;
  late final String timestamp;
  late final String message;
  late final tAuthUserResponse;

  setUp(() {
    authUserResponseMock = AuthUserResponseMock();
    usecase = GetAuthUserResponse(authUserResponseMock);
    status = 200;
    body = {
      "_id": 1,
      "email": "test@test.com",
      "password": "12345",
      "name": "Thulani",
      "surname": "Tshabalala",
      "roles": {}
    };
    timestamp = "2022-07-03 16:21:12.357246";
    message = "Success";
    tAuthUserResponse = AuthUserResponse(
        status: status, body: body, timestamp: timestamp, message: message);
  });

  test("should get valid user authentication response details", () async {
    // arrange
    when(authUserResponseMock.getAuthUserResponse(
            status, body, timestamp, message))
        .thenAnswer((_) async => Right(tAuthUserResponse));
    // act
    final result = await usecase(Params(
        status: status, body: body, timestamp: timestamp, message: message));
    // assert
    expect(result, Right(tAuthUserResponse));
    verify(authUserResponseMock.getAuthUserResponse(
        status, body, timestamp, message));
    verifyNoMoreInteractions(authUserResponseMock);
  });
}
