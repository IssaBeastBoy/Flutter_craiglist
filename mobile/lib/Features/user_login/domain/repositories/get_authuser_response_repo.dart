import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';

import '../entities/authuser_response.dart';

abstract class AuthUserResponseRepo {
  Future<Either<Failure, AuthUserResponse>>? getAuthUserResponse(
      int status, Map<String, dynamic> body, String created, String message);
}
