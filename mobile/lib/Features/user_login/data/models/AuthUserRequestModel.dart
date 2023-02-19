import '../../domain/entities/authuser_request.dart';

class AuthUserRequestModel extends AuthUser {
  final String email;
  final String password;

  AuthUserRequestModel(this.email, this.password)
      : super(email: email, password: password);

  factory AuthUserRequestModel.fromJSON(Map<String, dynamic> requestMap) {
    return AuthUserRequestModel(requestMap["email"], requestMap['password']);
  }
}
