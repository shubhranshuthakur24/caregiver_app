import 'package:intl/intl.dart';

class Test2 {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yMMMd').format(dateTime).toString();
  }
}
