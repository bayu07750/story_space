import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:story_space/core/domain/model/story.dart';
import 'package:story_space/core/presentation/util/context_ext.dart';
import 'package:story_space/core/presentation/util/story_ext.dart';
import 'package:story_space/stories/presentation/util/random.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
    required this.story,
    required this.onTap,
    required this.isDetail,
  });

  final Story story;
  final Function() onTap;
  final bool isDetail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/seed/person/44/44',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              story.name,
                              style: context.textTheme.labelLarge,
                            ),
                            Text(
                              story.prettyDate,
                              style: context.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.more_vert),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        story.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: double.infinity,
                        height: isDetail ? null : 300,
                        decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(100),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: story.photoUrl,
                            fit: BoxFit.fitWidth,
                            progressIndicatorBuilder: (context, url, progress) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Center(
                                child: Text(context.getString.imageErrorDesc),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.insert_comment_outlined,
                                  size: 22,
                                  color: context.colorsScheme.onSurface
                                      .withAlpha(120),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  generateRandomNumber(1, 100).toString(),
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.reply_all_rounded,
                                  size: 22,
                                  color: context.colorsScheme.onSurface
                                      .withAlpha(120),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  generateRandomNumber(1, 1000).toString(),
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.favorite_border,
                                  size: 22,
                                  color: context.colorsScheme.onSurface
                                      .withAlpha(120),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  generateRandomNumber(1, 1000).toString(),
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.bar_chart_rounded,
                                  size: 22,
                                  color: context.colorsScheme.onSurface
                                      .withAlpha(120),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  generateRandomNumber(1, 1000).toString(),
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
