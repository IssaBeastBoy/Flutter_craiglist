import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecase/usecase.dart';

import '../entities/authuser.dart';
import '../repositories/get_authuser_repo.dart';

class GetAuthUser implements UseCase<AuthUser, Params> {
  final AuthUserRepo repo;

  GetAuthUser(this.repo);

  @override
  Future<Either<Failure, AuthUser>?> call(params) async {
    // TODO: implement call
    return await repo.getAuthUser(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
