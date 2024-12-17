// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';

@Freezed(
  toJson: false,
  fromJson: false,
)
class Story with _$Story {
  const factory Story({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required String createdAt,
    double? lat,
    double? lon,
  }) = _Story;
}
