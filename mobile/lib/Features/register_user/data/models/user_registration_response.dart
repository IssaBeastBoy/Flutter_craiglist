import '../../domain/entities/register_user_response.dart';

class UserRegistrationResponseModel extends RegistrationResponse {
  final int status;
  final Map<String, dynamic> body;
  final String timestamp;
  final String message;

  UserRegistrationResponseModel(
      this.status, this.body, this.timestamp, this.message)
      : super(
            status: status, body: body, timestamp: timestamp, message: message);

  factory UserRegistrationResponseModel.fromJSON(
      Map<String, dynamic> requestMap) {
    return UserRegistrationResponseModel(requestMap["status"],
        requestMap["body"], requestMap["timestamp"], requestMap["message"]);
  }
}
