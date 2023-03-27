import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/authuser_request.dart';
import '../../domain/entities/authuser_response.dart';
import '../../domain/repositories/get_authuser_request_repo.dart';
import '../data_sources/authuser_remote_ds.dart';

class AuthUserRequestImplementation implements AuthUserRepo {
  final AuthUserRemoteDS authUserRemoteDS;

  AuthUserRequestImplementation({required this.authUserRemoteDS});

  @override
  Future<Either<Failure, AuthUserResponse>>? getAuthUser(
      AuthUser requestModel) async {
    // TODO: implement setAuthUser
    return Right(await authUserRemoteDS.getAuthUserInfo(requestModel)!);
  }
}
