import 'package:equatable/equatable.dart';

class AuthUserResponse extends Equatable {
  final int status;
  final Map<String, dynamic> body;
  final String timestamp;
  final String message;

  AuthUserResponse(
      {required this.status,
      required this.body,
      required this.timestamp,
      required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [status, body, timestamp, message];
}
