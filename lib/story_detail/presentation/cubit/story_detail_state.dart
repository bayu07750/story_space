// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_space/core/domain/model/story.dart';

part 'story_detail_state.freezed.dart';

@Freezed(
  toJson: false,
  fromJson: false,
)
class StoryDetailState with _$StoryDetailState {
  static StoryDetailState initial() => const StoryDetailState(
        isLoading: false,
        isError: false,
      );

  const factory StoryDetailState({
    required bool isLoading,
    required bool isError,
    String? message,
    Story? story,
  }) = _StoryDetailState;
}
