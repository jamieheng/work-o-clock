import 'dart:async';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Timer? _timer;
  var elapsedTime = Duration.zero.obs;
  var isClockedIn = false.obs;

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    elapsedTime.value = Duration.zero;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsedTime.value += const Duration(seconds: 1);
      print("Elapsed time updated: ${elapsedTimeString}");
    });
  }

  void stopTimer() {
    _timer?.cancel();
    print("Timer stopped. Final elapsed time: ${elapsedTimeString}");
  }

  void toggleClockInOut() {
    if (isClockedIn.value) {
      stopTimer();
    } else {
      startTimer();
    }
    isClockedIn.value = !isClockedIn.value;
    print(
        "Clock-in status toggled: ${isClockedIn.value ? 'Clocked In' : 'Clocked Out'}");
  }

  String get elapsedTimeString {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(elapsedTime.value.inHours);
    final minutes = twoDigits(elapsedTime.value.inMinutes.remainder(60));
    final seconds = twoDigits(elapsedTime.value.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }
}
