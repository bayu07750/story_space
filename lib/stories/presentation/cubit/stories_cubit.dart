import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:story_space/core/data/network/api_service.dart';
import 'package:story_space/core/data/util/logger.dart';
import 'package:story_space/core/domain/model/story.dart';
import 'package:story_space/core/domain/repository/story_repository.dart';
import 'package:story_space/stories/presentation/cubit/stories_state.dart';

class StoriesCubit extends Cubit<StoriesState> {
  StoriesCubit(this._storyRepository) : super(StoriesState.initial()) {
    _init();
  }

  final StoryRepository _storyRepository;

  final PagingController<int, Story> _pagingController = PagingController(
    firstPageKey: ApiService.initialPage,
    invisibleItemsThreshold: 1,
  );

  PagingController<int, Story> get pagingController => _pagingController;

  _init() async {
    _pagingController.addPageRequestListener(
      (pageKey) {
        _fetchPage(pageKey);
      },
    );
  }

  _fetchPage(int page) async {
    Logger.log('fetchPage; page $page', prefix: 'StoriesCubit');
    final response = await _storyRepository.getStories(page: page);
    response.fold(
      (exception) {
        _pagingController.error = exception;
      },
      (data) {
        final isLastPage = data.length < ApiService.pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(data);
          return;
        }
        _pagingController.appendPage(data, ++page);
      },
    );
  }

  @override
  Future<void> close() async {
    _pagingController.dispose();
    await super.close();
  }
}
