import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/register_user_request.dart';
import '../entities/register_user_response.dart';
import '../repositories/get_register_user_request_repo.dart';

class GetRegisterUser implements UseCase<RegistrationResponse, Params> {
  final RegisterUserRepo registerUserRepo;

  GetRegisterUser(this.registerUserRepo);
  
  @override
  Future<Either<Failure, RegistrationResponse>?> call(Params params) async {
    // TODO: implement call
    return await registerUserRepo.getRegisterUser(params.registerUser);
  }
}

class Params extends Equatable {
  final RegisterUser registerUser;

  Params(
      {required this.registerUser});

  @override
  List<Object?> get props => [registerUser];
}
