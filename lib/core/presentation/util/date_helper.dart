import 'package:intl/intl.dart';
import 'package:story_space/core/data/util/logger.dart';

class DateHelper {
  static String prettyDate(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);
      DateFormat dateFormat = DateFormat('dd MMM yyyy, HH:mm');
      return dateFormat.format(dateTime.toLocal());
    } catch (e) {
      Logger.log('invalid date $dateString with exception $e',
          prefix: 'DateHelper.prettyDate');
      return 'Invalid date';
    }
  }
}
