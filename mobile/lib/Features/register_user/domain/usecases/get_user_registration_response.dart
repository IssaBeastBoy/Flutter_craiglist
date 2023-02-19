import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/register_user_response.dart';
import '../repositories/get_user_registration_responserepo.dart';

class GetUserRegistrationResponse
    implements UseCase<RegistrationResponse, Params> {
  final RegistrationResponseRepo registrationResponseRepo;

  GetUserRegistrationResponse(this.registrationResponseRepo);

  @override
  Future<Either<Failure, RegistrationResponse>?> call(Params params) async {
    // TODO: implement call
    return await registrationResponseRepo.getRegistrationResponse(
        params.status, params.body, params.timestamp, params.message);
  }
}

class Params extends Equatable {
  final int status;
  final Map<String, dynamic> body;
  final String timestamp;
  final String message;

  Params(
      {required this.status,
      required this.body,
      required this.timestamp,
      required this.message});

  @override
  List<Object?> get props => [status, body, timestamp, message];
}
