import 'package:bloc/bloc.dart';
import 'package:story_space/core/data/util/logger.dart';
import 'package:story_space/core/domain/repository/story_repository.dart';
import 'package:story_space/story_detail/presentation/cubit/story_detail_state.dart';

class StoryDetailCubit extends Cubit<StoryDetailState> {
  StoryDetailCubit(this._storyRepository) : super(StoryDetailState.initial());

  final StoryRepository _storyRepository;

  Future<void> getStoryDetail({required String id}) async {
    emit(state.copyWith(isLoading: true));
    final response = await _storyRepository.getStoryDetail(id);
    response.fold(
      (exception) {
        Logger.log('getStoryDetail fail $exception');
        emit(state.copyWith(
            isLoading: false, isError: true, message: exception.toString()));
      },
      (value) {
        Logger.log('getStoryDetail success $value');
        emit(state.copyWith(isLoading: false, isError: false, story: value));
      },
    );
  }
}
