import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_state.freezed.dart';

@Freezed(
  toJson: false,
  fromJson: false,
)
class LogoutState with _$LogoutState {
  static LogoutState initial() => const LogoutState(
        isLoading: false,
        isError: false,
        isSuccess: false,
      );

  const factory LogoutState({
    required bool isLoading,
    required bool isError,
    required bool isSuccess,
  }) = _LogoutState;
}
