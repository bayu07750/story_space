// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@Freezed(
  toJson: false,
  fromJson: false,
)
class LoginState with _$LoginState {
  static LoginState initial() => const LoginState(
        isLoading: false,
        isError: false,
        message: '',
      );

  const factory LoginState({
    required bool isLoading,
    required bool isError,
    required String message,
  }) = _LoginState;
}
