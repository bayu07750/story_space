import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_space/core/data/network/model/story_response.dart';

part 'story_detail_response.freezed.dart';
part 'story_detail_response.g.dart';

@Freezed()
class StoryDetailResponse with _$StoryDetailResponse {
  const factory StoryDetailResponse({
    required bool error,
    required String message,
    StoryResponse? story,
  }) = _StoryDetailResponse;

  factory StoryDetailResponse.fromJson(Map<String, dynamic> map) => _$StoryDetailResponseFromJson(map);

  static String toJsonString(StoryDetailResponse response) => json.encode(response.toJson());

  factory StoryDetailResponse.fromJsonString(String source) =>
      StoryDetailResponse.fromJson(json.decode(source) as Map<String, dynamic>);
}
