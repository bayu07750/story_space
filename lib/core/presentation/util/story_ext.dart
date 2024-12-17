import 'package:story_space/core/domain/model/story.dart';
import 'package:story_space/core/presentation/util/date_helper.dart';

extension StoryExt on Story {
  String get prettyDate => DateHelper.prettyDate(createdAt);
}
