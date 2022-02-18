import 'package:flutter/material.dart';

import 'custom_calander/custom_calander.dart';

class CalanderPopUpScreen {
  // static DateTime selectedDate = DateTime.now();
  static DateTime selectedDate = availableSlotDateList[0];
  static List<DateTime> availableSlotDateList = [];

  static bool _predicate(DateTime day) {
    // if ((day.isAfter(DateTime(2020, 1, 5)) &&
    //     day.isBefore(DateTime(2020, 1, 9)))) {
    //   return true;
    // }
    // var c = DateTime(2020, 1, 10);
    // c = c.subtract(Duration(days: 1));

    for (var i in availableSlotDateList) {
      if ((day.isAfter(i.subtract(Duration(days: 1))) && day.isBefore(i.add(Duration(days: 1))))) {
        return true;
      }
    }

    return false;
  }

  static Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await customDatePicker(
        selectableDayPredicate: _predicate,
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      // setState(() {
      //   selectedDate = picked;
      // }
      // )
      selectedDate = picked;
    ;
  }
}
