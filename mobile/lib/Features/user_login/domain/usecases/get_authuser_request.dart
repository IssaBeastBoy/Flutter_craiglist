import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/authuser_request.dart';
import '../entities/authuser_response.dart';
import '../repositories/get_authuser_request_repo.dart';

class GetAuthUser implements UseCase<AuthUserResponse, Params> {
  final AuthUserRepo repo;

  GetAuthUser(this.repo);

  @override
  Future<Either<Failure, AuthUserResponse>?> call(Params params) async {
    // TODO: implement call
    return await repo.getAuthUser(params.requestEntity);
  }
}

class Params extends Equatable {
  final AuthUser requestEntity;

  Params({required this.requestEntity});

  @override
  List<Object?> get props => [requestEntity];
}
