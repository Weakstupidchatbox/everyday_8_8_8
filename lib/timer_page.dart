import 'package:flutter/material.dart';

import 'timer_controller.dart';
import 'timer_widget.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late final TimerController controller;

  @override
  void initState() {
    super.initState();

    controller = TimerController();
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Three Timers'),
      ),

      body: AnimatedBuilder(
        animation: controller,

        builder: (context, child) {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                3,
                (index) {
                  return TimerWidget(
                    index: index,

                    timeText: controller.formatTime(
                      controller.remainingSeconds[index],
                    ),

                    isActive:
                        controller.activeTimer == index,

                    onPressed: () {
                      controller.switchTimer(index);
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}