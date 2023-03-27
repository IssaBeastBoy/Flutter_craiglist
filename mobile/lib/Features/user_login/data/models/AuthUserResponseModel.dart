import '../../domain/entities/authuser_response.dart';

class AuthUserResponseModel extends AuthUserResponse {
  final int status;
  final Map<String, dynamic> body;
  final String created;
  final String message;

  AuthUserResponseModel(this.status, this.body, this.created, this.message)
      : super(
            status: status, body: body, created: created, message: message);

  factory AuthUserResponseModel.fromJSON(Map<String, dynamic> responseMap) {
    return AuthUserResponseModel(responseMap["status"], responseMap["body"],
        responseMap["created"], responseMap["message"]);
  }
}
