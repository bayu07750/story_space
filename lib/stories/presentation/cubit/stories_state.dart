// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_space/core/domain/model/story.dart';

part 'stories_state.freezed.dart';

@Freezed(
  toJson: false,
  fromJson: false,
)
class StoriesState with _$StoriesState {
  static StoriesState initial() => const StoriesState(
        isLoading: false,
        isError: false,
        stories: [],
      );

  const factory StoriesState({
    required bool isLoading,
    required bool isError,
    required List<Story> stories,
    String? message,
  }) = _StoriesState;
}
