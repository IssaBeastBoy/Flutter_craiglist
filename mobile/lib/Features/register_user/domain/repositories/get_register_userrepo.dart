import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/register_user.dart';

abstract class RegisterUserRepo {
  Future<Either<Failure, RegisterUser>>? getRegisterUder(String password,
      String email, String name, String surname, Map<String, dynamic> roles);
}
