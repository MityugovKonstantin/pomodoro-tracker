import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({Key? key}) : super(key: key);

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  late Timer pomodoroTimer;
  bool isTimerWork = false;
  int iteration = 0;
  int minute = 25;
  int second = 0;

  void _timerStart() {
    pomodoroTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (second > 0) {
          second--;
        } else if (minute > 0) {
          second = 59;
          minute--;
        } else {
          iteration++;
          (iteration == 9)
              ? {minute = 30, second = 0}
              : (iteration % 2 == 0)
                  ? {minute = 25, second = 0}
                  : {minute = 5, second = 0};
          if (iteration == 10) {
            iteration = 0;
            isTimerWork = false;
            pomodoroTimer.cancel();
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Помодоро'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < 4; ++i)
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: (iteration < i * 2)
                          ? const Text('25:00')
                          : (iteration > i * 2)
                              ? const Text('Done')
                              : Text('$minute:$second'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: (iteration < (i * 2 + 1))
                          ? const Text('5:00')
                          : (iteration > (i * 2 + 1))
                              ? const Text('Done')
                              : Text('$minute:$second'),
                    )
                  ],
                ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: (iteration < 8)
                        ? const Text('25:00')
                        : (iteration > 8)
                            ? const Text('Done')
                            : Text('$minute:$second'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: (iteration < 9)
                        ? const Text('30:00')
                        : (iteration > 9)
                            ? const Text('Done')
                            : Text('$minute:$second'),
                  )
                ],
              ),
              !isTimerWork
                  ? OutlinedButton(
                      onPressed: () {
                        setState(() {
                          isTimerWork = true;
                        });
                        _timerStart();
                      },
                      child: const Text('Start pomodoro'))
                  : const Text('')
            ],
          ),
        ));
  }
}
