import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/register_user_request.dart';
import '../entities/register_user_response.dart';

abstract class RegisterUserRepo {
  Future<Either<Failure, RegistrationResponse>>? getRegisterUser(
      RegisterUser request);
}
