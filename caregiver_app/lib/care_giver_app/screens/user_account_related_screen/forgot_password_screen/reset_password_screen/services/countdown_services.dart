import 'dart:async';

import 'package:get/get.dart';

class CountdownSerices extends GetxController {
  late Timer _timer;
  RxInt start = 120.obs;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start--;
        }
      },
    );
  }
}
