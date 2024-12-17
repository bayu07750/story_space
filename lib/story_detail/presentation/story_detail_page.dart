import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_space/core/presentation/util/context_ext.dart';
import 'package:story_space/core/presentation/widget/empty_page.dart';
import 'package:story_space/core/presentation/widget/error_page.dart';
import 'package:story_space/core/presentation/widget/loading_page.dart';
import 'package:story_space/stories/presentation/widget/story_item.dart';
import 'package:story_space/story_detail/presentation/cubit/story_detail_cubit.dart';
import 'package:story_space/story_detail/presentation/cubit/story_detail_state.dart';
import 'package:story_space/story_detail/presentation/widget/story_detail_google_map.dart';

class StoryDetailPage extends StatelessWidget {
  const StoryDetailPage({super.key, required this.storyId});

  final String storyId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.getString.detailStory),
      ),
      body: SafeArea(
        top: false,
        child: BlocBuilder<StoryDetailCubit, StoryDetailState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingPage();
            }

            if (state.isError) {
              return ErrorPage(
                onRetry: () => context.read<StoryDetailCubit>().getStoryDetail(id: storyId),
              );
            }

            final story = state.story;

            if (story == null) {
              return const NoDataFound();
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StoryItem(
                      story: story,
                      onTap: () {}, // ignore
                      isDetail: true,
                    ),
                    const SizedBox(height: 24),
                    (() {
                      final lat = story.lat;
                      final lon = story.lon;
                      if (lat != null && lon != null) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '📍 ${context.getString.location}',
                              style: context.textTheme.labelLarge,
                            ),
                            const SizedBox(height: 8),
                            StoryDetailGoogleMap(lat: lat, lon: lon),
                            const SizedBox(height: 42),
                          ],
                        );
                      }

                      return Container();
                    })(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
