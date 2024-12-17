// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_story_state.freezed.dart';

@Freezed(
  toJson: false,
  fromJson: false,
)
class AddStoryState with _$AddStoryState {
  static AddStoryState initial() => const AddStoryState(
        isLoading: false,
        isError: false,
        isSuccess: false,
      );

  const factory AddStoryState({
    required bool isLoading,
    required bool isError,
    required bool isSuccess,
    String? message,
  }) = _AddStoryState;
}
