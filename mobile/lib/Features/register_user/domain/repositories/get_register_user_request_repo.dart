import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/register_user_request.dart';

abstract class RegisterUserRepo {
  Future<Either<Failure, RegisterUser>>? getRegisterUser(String password,
      String email, String name, String surname, Map<String, dynamic> roles);
}
