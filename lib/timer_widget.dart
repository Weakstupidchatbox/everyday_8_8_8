import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final int index;
  final String timeText;
  final bool isActive;
  final VoidCallback onPressed;

  const TimerWidget({
    super.key,
    required this.index,
    required this.timeText,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Timer ${index + 1}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                timeText,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: isActive
                      ? Colors.green
                      : Colors.black,
                ),
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  isActive
                      ? 'Running'
                      : 'Switch to Timer ${index + 1}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}