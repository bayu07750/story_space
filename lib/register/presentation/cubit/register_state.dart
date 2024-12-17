// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@Freezed(
  toJson: false,
  fromJson: false,
)
class RegisterState with _$RegisterState {
  static RegisterState initial() => const RegisterState(
        isLoading: false,
        isError: false,
        message: '',
      );

  const factory RegisterState({
    required bool isLoading,
    required bool isError,
    required String message,
  }) = _RegisterState;
}
