import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:story_space/core/domain/model/story.dart';

abstract class StoryRepository {
  Future<Either<Exception, List<Story>>> getStories({
    required int page,
  });
  Future<Either<Exception, Story?>> getStoryDetail(String id);
  Future<Either<Exception, String>> addStory(
    String description,
    File file, {
    double? lat,
    double? lon,
  });
}
