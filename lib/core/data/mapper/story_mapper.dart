import 'package:story_space/core/data/network/model/story_response.dart';
import 'package:story_space/core/domain/model/story.dart';

extension StoryMapper on StoryResponse {
  Story get toDomain => Story(
        id: id,
        name: name,
        description: description,
        photoUrl: photoUrl,
        createdAt: createdAt,
        lat: lat,
        lon: lon,
      );
}
