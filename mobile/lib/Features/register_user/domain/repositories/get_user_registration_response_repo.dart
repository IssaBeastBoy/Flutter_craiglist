import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/register_user_response.dart';

abstract class RegistrationResponseRepo {
  Future<Either<Failure, RegistrationResponse>>? getRegistrationResponse(
      int status, Map<String, dynamic> body, String timestamp, String message);
}
