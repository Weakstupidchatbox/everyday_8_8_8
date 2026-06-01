import 'dart:async';

import 'package:flutter/material.dart';

class TimerController extends ChangeNotifier {
  static const int initialTime = 8 * 60 * 60;

  final List<int> remainingSeconds = List.filled(
    3,
    initialTime,
  );

  int activeTimer = 0;

  Timer? _ticker;

  TimerController() {
    startTicker();
  }

  void disposeController() {
    _ticker?.cancel();
  }

  void startTicker() {
    _ticker?.cancel();

    _ticker = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (remainingSeconds[activeTimer] > 0) {
          remainingSeconds[activeTimer]--;

          notifyListeners();
        }
      },
    );
  }

  void switchTimer(int index) {
    if (index < 0 || index >= remainingSeconds.length) {
      return;
    }

    activeTimer = index;

    notifyListeners();
  }

  String formatTime(int seconds) {
    final h = seconds ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    final s = seconds % 60;

    return '${h.toString().padLeft(2, '0')}:'
        '${m.toString().padLeft(2, '0')}:'
        '${s.toString().padLeft(2, '0')}';
  }
}