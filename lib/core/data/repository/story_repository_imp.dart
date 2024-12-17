import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:story_space/core/data/mapper/story_mapper.dart';
import 'package:story_space/core/data/network/api_service.dart';
import 'package:story_space/core/data/network/model/base_response.dart';
import 'package:story_space/core/data/network/model/story_detail_response.dart';
import 'package:story_space/core/data/network/model/story_response.dart';
import 'package:story_space/core/domain/model/story.dart';
import 'package:story_space/core/domain/repository/story_repository.dart';

class StoryRepositoryImp implements StoryRepository {
  final ApiService _apiService;

  StoryRepositoryImp({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Either<Exception, List<Story>>> getStories({
    required int page,
  }) async {
    final response = await _apiService.getStories(page: page);
    if (response.isLeft()) {
      return response.map((_) => []);
    }

    final data = response
        .getRight()
        .getOrElse(() => const ListStoriesResponse(error: true, message: 'Error'));
    if (data.error) {
      return Either.left(Exception(data.message));
    }

    return Either.right((data.listStory ?? []).map((e) => e.toDomain).toList());
  }

  @override
  Future<Either<Exception, String>> addStory(String description, File file,
      {double? lat, double? lon}) async {
    final response =
        await _apiService.addNewStory(description, file, lat: lat, lon: lon);
    if (response.isLeft()) {
      return response.map((_) => '');
    }

    final data = response
        .getRight()
        .getOrElse(() => const BaseResponse(error: true, message: 'Error'));
    if (data.error) {
      return Either.left(Exception(data.message));
    }

    return Either.right(data.message);
  }

  @override
  Future<Either<Exception, Story?>> getStoryDetail(String id) async {
    final response = await _apiService.getStoryDetail(id);
    if (response.isLeft()) {
      return response.map((a) => a.story?.toDomain);
    }

    final data = response.getRight().getOrElse(
        () => const StoryDetailResponse(error: true, message: 'Error', story: null));
    if (data.error) {
      return Either.left(Exception(data.message));
    }

    return Either.right(data.story?.toDomain);
  }
}
