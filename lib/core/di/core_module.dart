import 'package:story_space/core/data/network/http_api_service.dart';
import 'package:story_space/core/data/repository/auth_repository_imp.dart';
import 'package:story_space/core/data/repository/story_repository_imp.dart';
import 'package:story_space/core/domain/repository/auth_repository.dart';
import 'package:story_space/core/domain/repository/story_repository.dart';

class CoreModule {
  static AuthRepository provideAuthRepository() {
    return AuthRepositoryImp(apiService: HttpApiService());
  }

  static StoryRepository provideStoryRepository() {
    return StoryRepositoryImp(apiService: HttpApiService());
  }
}
