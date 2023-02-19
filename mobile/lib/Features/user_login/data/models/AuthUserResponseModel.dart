import '../../domain/entities/authuser_response.dart';

class AuthUserResponseModel extends AuthUserResponse {
  final int status;
  final Map<String, dynamic> body;
  final String timestamp;
  final String message;

  AuthUserResponseModel(this.status, this.body, this.timestamp, this.message)
      : super(
            status: status, body: body, timestamp: timestamp, message: message);

  factory AuthUserResponseModel.fromJSON(Map<String, dynamic> requestMap) {
    return AuthUserResponseModel(requestMap["status"], requestMap["body"],
        requestMap["timestamp"], requestMap["message"]);
  }
}
