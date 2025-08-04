import 'package:intl/intl.dart';

extension DateTimeExt on DateTime? {
  String format(String pattern) {
    if (this != null) {
      try {
        return DateFormat(pattern).format(this!);
      } catch (e) {
        return '';
      }
    } else {
      return '';
    }
  }
}
