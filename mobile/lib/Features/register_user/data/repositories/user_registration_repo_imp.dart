import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/register_user_request.dart';
import '../../domain/repositories/get_register_user_request_repo.dart';
import '../data_sources/register_user_remote_ds.dart';

class UserRegistrationRepoImplementation implements RegisterUserRepo {
  final RegisterUserRemoteDS remoteDS;

  UserRegistrationRepoImplementation({required this.remoteDS});
  @override
  Future<Either<Failure, RegisterUser>> getRegisterUser(
      String password,
      String email,
      String name,
      String surname,
      Map<String, dynamic> roles) async {
    // TODO: implement getRegisterUser
    return Right(
        await remoteDS.getRegisterUser(password, email, name, surname, roles)!);
  }
}
