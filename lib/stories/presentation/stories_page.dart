import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:story_space/core/domain/model/story.dart';
import 'package:story_space/core/presentation/util/context_ext.dart';
import 'package:story_space/core/presentation/widget/error_page.dart';
import 'package:story_space/core/presentation/widget/loading_page.dart';
import 'package:story_space/stories/presentation/cubit/stories_cubit.dart';
import 'package:story_space/stories/presentation/widget/story_item.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PagingController<int, Story> pagingController = context.read<StoriesCubit>().pagingController;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.getString.stories),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final data = await context.push('/add-story');
          if (data != null && data is bool && data == true) {
            if (context.mounted) {
              pagingController.refresh();
            }
          }
        },
        backgroundColor: context.colorsScheme.primary,
        child: Icon(
          Icons.add_rounded,
          color: context.colorsScheme.onPrimary,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.sync(() => pagingController.refresh());
        },
        child: PagedListView(
          pagingController: pagingController,
          padding: const EdgeInsets.all(8),
          builderDelegate: PagedChildBuilderDelegate<Story>(
            itemBuilder: (context, story, index) {
              return StoryItem(
                story: story,
                onTap: () {
                  context.pushNamed(
                    'detailStory',
                    pathParameters: {
                      'id': story.id,
                    },
                  );
                },
                isDetail: false,
              );
            },
            animateTransitions: true,
            firstPageProgressIndicatorBuilder: (context) {
              return const LoadingPage();
            },
            firstPageErrorIndicatorBuilder: (context) {
              return ErrorPage(
                onRetry: () {
                  pagingController.refresh();
                },
              );
            },
            newPageProgressIndicatorBuilder: (context) {
              return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(context.getString.loading),
                    ],
                  ),
                ),
              );
            },
            newPageErrorIndicatorBuilder: (context) {
              return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        context.getString.errorMessage,
                        style: context.textTheme.labelLarge,
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          pagingController.retryLastFailedRequest();
                        },
                        child: Text(context.getString.retry),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
