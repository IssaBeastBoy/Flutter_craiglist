import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/authuser_request.dart';

abstract class AuthUserRepo {
  Future<Either<Failure, AuthUser>>? getAuthUser(String email, String password);
}
