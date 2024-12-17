import 'package:fpdart/fpdart.dart';
import 'package:story_space/core/data/mapper/user_mapper.dart';
import 'package:story_space/core/data/network/api_service.dart';
import 'package:story_space/core/data/network/model/base_response.dart';
import 'package:story_space/core/data/network/model/login_response.dart';
import 'package:story_space/core/data/preferences/user_prefenrece.dart';
import 'package:story_space/core/domain/model/user.dart';
import 'package:story_space/core/domain/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final ApiService _apiService;

  AuthRepositoryImp({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Option<User?>> getCurrentUser() async {
    return Option.of(await UserPrefenrece.getUser());
  }

  @override
  Future<Either<Exception, String>> login(String email, String password) async {
    final response = await _apiService.login(email, password);
    if (response.isLeft()) {
      return response.map((_) => '');
    }

    final data = response
        .getRight()
        .getOrElse(() => const LoginResponse(error: true, message: 'Error'));
    if (data.error) {
      return Either.left(Exception(data.message));
    }

    final user = data.loginResult!.toDomain;
    await UserPrefenrece.saveUser(user);

    return Either.right(data.message);
  }

  @override
  Future<Either<Exception, String>> register(
      String name, String email, String password) async {
    final response = await _apiService.register(name, email, password);
    if (response.isLeft()) {
      return response.map((_) => '');
    }

    final data = response
        .getRight()
        .getOrElse(() => const BaseResponse(error: true, message: 'Error'));
    if (data.error) {
      return Either.left(Exception(data.message));
    }

    return Either.right(data.message);
  }
}
