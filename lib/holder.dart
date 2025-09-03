import 'dart:async';

import 'package:flutter/foundation.dart';

class Gears extends ChangeNotifier {
  int hour = 0;
  int minute = 0;
  int second = 0;
  int year = 0;
  int month = 0;
  int day = 0;

  void ggg(){
    set();
    Timer.periodic(const Duration(seconds: 1), (timer) => set(),);
  }

  Future<void> set() async {
    var base = await answer();

    if (hour != base.hour) {
      hour = base.hour;
    }

    if (minute != base.minute) {
      minute = base.minute;
    }

    if (second != base.second) {
      second = base.second;
    }

    if (day != base.day) {
      day = base.day;
    }

    if (month != base.month) {
      month = base.month;
    }

    if (year != base.year) {
      year = base.year;
    }

    notifyListeners();
  }

  Future<DateTime> answer() async {
    return DateTime.now();
  }
}
