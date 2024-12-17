import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:story_space/add_story/presentation/cubit/add_story_state.dart';
import 'package:story_space/core/data/util/logger.dart';
import 'package:story_space/core/domain/repository/story_repository.dart';

class AddStoryCubit extends Cubit<AddStoryState> {
  AddStoryCubit(this._storyRepository) : super(AddStoryState.initial());

  final StoryRepository _storyRepository;

  addNewStory({
    required String description,
    required File file,
    double? lat,
    double? long,
  }) async {
    emit(state.copyWith(isLoading: true));
    final response = await _storyRepository.addStory(
      description,
      file,
      lat: lat,
      lon: long,
    );

    response.fold(
      (exception) {
        Logger.log('addNewStory fail $exception');
        emit(state.copyWith(
            isLoading: false, isError: true, message: exception.toString()));
      },
      (value) {
        Logger.log('addNewStory success $value');
        emit(state.copyWith(
            isLoading: false, isError: false, isSuccess: true, message: value));
      },
    );
  }
}
