import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/Features/register_user/domain/repositories/get_register_user_request_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/register_user_request.dart';

class GetRegisterUser implements UseCase<RegisterUser, Params> {
  final RegisterUserRepo registerUserRepo;

  GetRegisterUser(this.registerUserRepo);

  @override
  Future<Either<Failure, RegisterUser>?> call(Params params) async {
    // TODO: implement call
    return await registerUserRepo.getRegisterUder(params.password, params.email,
        params.name, params.surname, params.roles);
  }
}

class Params extends Equatable {
  final String password;
  final String email;
  final String name;
  final String surname;
  final Map<String, dynamic> roles;

  Params(
      {required this.password,
      required this.email,
      required this.name,
      required this.surname,
      required this.roles});

  @override
  List<Object?> get props => [password, email, name, surname, roles];
}
