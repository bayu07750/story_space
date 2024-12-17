import 'package:bloc/bloc.dart';
import 'package:story_space/core/data/util/logger.dart';
import 'package:story_space/core/domain/repository/auth_repository.dart';
import 'package:story_space/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(LoginState.initial());

  final AuthRepository _authRepository;

  login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true, isError: false));

    final response = await _authRepository.login(email, password);
    response.fold(
      (exception) {
        Logger.log('login fail; $exception');
        emit(state.copyWith(
            isLoading: false, isError: true, message: exception.toString()));
      },
      (value) {
        Logger.log('login success; $value');
        emit(state.copyWith(isLoading: false, isError: false, message: value));
      },
    );
  }
}
