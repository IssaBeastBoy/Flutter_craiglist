import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/authuser_request.dart';
import '../entities/authuser_response.dart';

abstract class AuthUserRepo {
  Future<Either<Failure, AuthUserResponse>>? getAuthUser(
      AuthUser requestEntity);
}
