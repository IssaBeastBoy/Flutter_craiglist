import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AuthUser extends Equatable {
  final String email;
  final String password;

  AuthUser({required this.email, required this.password}) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
