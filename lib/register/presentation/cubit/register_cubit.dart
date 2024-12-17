import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:story_space/core/data/util/logger.dart';
import 'package:story_space/core/domain/repository/auth_repository.dart';
import 'package:story_space/register/presentation/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepository) : super(RegisterState.initial());

  final AuthRepository _authRepository;

  register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true, isError: false, message: ''));

    final Either<Exception, String> response = await _authRepository.register(
      name,
      email,
      password,
    );

    response.fold(
      (exception) {
        Logger.log('register fail; $exception');
        emit(state.copyWith(
            isLoading: false, isError: true, message: exception.toString()));
      },
      (value) {
        Logger.log('register success; $value');
        emit(state.copyWith(isLoading: false, isError: false, message: value));
      },
    );
  }
}
