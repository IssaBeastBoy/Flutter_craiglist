import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/core/error/failures.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/authuser_response.dart';
import '../repositories/get_authuser_response_repo.dart';

class GetAuthUserResponse implements UseCase<AuthUserResponse, Params> {
  final AuthUserResponseRepo authUserResponseRepo;

  GetAuthUserResponse(this.authUserResponseRepo);

  @override
  Future<Either<Failure, AuthUserResponse>?> call(Params params) async {
    // TODO: implement call
    return await authUserResponseRepo.getAuthUserResponse(
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
