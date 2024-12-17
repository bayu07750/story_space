import 'package:fpdart/fpdart.dart';
import 'package:story_space/core/domain/model/user.dart';

abstract class AuthRepository {
  Future<Option<User?>> getCurrentUser();

  Future<Either<Exception, String>> login(
    String email,
    String password,
  );

  Future<Either<Exception, String>> register(
    String name,
    String email,
    String password,
  );
}
