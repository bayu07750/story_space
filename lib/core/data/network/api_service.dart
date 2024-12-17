import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:story_space/core/data/network/model/base_response.dart';
import 'package:story_space/core/data/network/model/login_response.dart';
import 'package:story_space/core/data/network/model/story_detail_response.dart';
import 'package:story_space/core/data/network/model/story_response.dart';

abstract class ApiService {
  static const String baseUrl = 'https://story-api.dicoding.dev/v1/';
  static const int initialPage = 1;
  static const int pageSize = 10;
  static const int withLocation = 1; //1 (true) | 0 (false)

  Future<Either<Exception, LoginResponse>> login(
    String email,
    String password,
  );
  Future<Either<Exception, BaseResponse>> register(
    String name,
    String email,
    String password,
  );
  Future<Either<Exception, ListStoriesResponse>> getStories({
    int page = initialPage,
    int size = pageSize,
    int location = withLocation,
  });
  Future<Either<Exception, BaseResponse>> addNewStory(
    String description,
    File file, {
    double? lat,
    double? lon,
  });
  Future<Either<Exception, StoryDetailResponse>> getStoryDetail(String id);
}
