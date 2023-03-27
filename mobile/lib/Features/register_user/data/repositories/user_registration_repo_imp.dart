import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/register_user_request.dart';
import '../../domain/entities/register_user_response.dart';
import '../../domain/repositories/get_register_user_request_repo.dart';
import '../data_sources/register_user_remote_ds.dart';

class UserRegistrationRepoImplementation implements RegisterUserRepo {
  final RegisterUserRemoteDS remoteDS;

  UserRegistrationRepoImplementation({required this.remoteDS});

  @override
  Future<Either<Failure, RegistrationResponse>>? getRegisterUser(
      RegisterUser request) async {
    // TODO: implement getRegisterUser
    return Right(await remoteDS.getRegisterUserResponse(request)!);
  }

  
}
