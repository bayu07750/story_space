import 'package:flutter/foundation.dart';

class Logger {
  static const _defaultTag = 'StorySpace_Logger';

  static void log(String msg, {String tag = _defaultTag, String prefix = ''}) {
    if (kDebugMode) {
      debugPrint("========================");
      var message = '| $tag:';
      message += ' ${DateTime.now()}';
      if (prefix.isNotEmpty) {
        message += ' $prefix';
      }
      message += ' $msg |';

      debugPrint(message);
      debugPrint("========================");
    }
  }
}
