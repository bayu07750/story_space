import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_response.freezed.dart';
part 'story_response.g.dart';

@Freezed()
class ListStoriesResponse with _$ListStoriesResponse {
  const factory ListStoriesResponse({
    required bool error,
    required String message,
    List<StoryResponse>? listStory,
  }) = _ListStoriesResponse;

  factory ListStoriesResponse.fromJson(Map<String, dynamic> map) => _$ListStoriesResponseFromJson(map);

  static String toJsonString(ListStoriesResponse response) => json.encode(response.toJson());

  factory ListStoriesResponse.fromJsonString(String source) =>
      ListStoriesResponse.fromJson(json.decode(source) as Map<String, dynamic>);
}

@Freezed()
class StoryResponse with _$StoryResponse {
  const factory StoryResponse({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required String createdAt,
    double? lat,
    double? lon,
  }) = _StoryResponse;

  factory StoryResponse.fromJson(Map<String, dynamic> map) => _$StoryResponseFromJson(map);

  static String toJsonString(StoryResponse response) => json.encode(response.toJson());

  factory StoryResponse.fromJsonString(String source) =>
      StoryResponse.fromJson(json.decode(source) as Map<String, dynamic>);
}
