import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_tracker/widgets/timer_format.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({Key? key}) : super(key: key);

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  late Timer pomodoroTimer;
  bool isTimerWork = false;
  int iteration = 0;
  int minute = 25;
  int second = 0;

  void _timerStart() {
    pomodoroTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (second > 0) {
          audioPlayer.play(AssetSource('sounds/pomodoro_tick_sound.mp3'));
          second--;
        } else if (minute > 0) {
          audioPlayer.play(AssetSource('sounds/pomodoro_tick_sound.mp3'));
          second = 59;
          minute--;
        } else {
          audioPlayer.stop();
          audioPlayer
              .play(AssetSource('sounds/pomodoro_iteration_done_sound.mp3'));
          iteration++;
          (iteration == 9)
              ? {minute = 30, second = 0}
              : (iteration % 2 == 0)
                  ? {minute = 25, second = 0}
                  : {minute = 5, second = 0};
          if (iteration == 10) {
            iteration = 0;
            isTimerWork = false;
            audioPlayer.stop();
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
                          ? const Text('25:00', style: TextStyle(fontSize: 25))
                          : (iteration > i * 2)
                              ? const Text('Done',
                                  style: TextStyle(fontSize: 25))
                              : Text(TimerFormat.pomodoro(minute, second),
                                  style: TextStyle(fontSize: 25)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: (iteration < (i * 2 + 1))
                          ? const Text('05:00', style: TextStyle(fontSize: 25))
                          : (iteration > (i * 2 + 1))
                              ? const Text('Done',
                                  style: TextStyle(fontSize: 25))
                              : Text(TimerFormat.pomodoro(minute, second),
                                  style: TextStyle(fontSize: 25)),
                    )
                  ],
                ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: (iteration < 8)
                        ? const Text('25:00', style: TextStyle(fontSize: 25))
                        : (iteration > 8)
                            ? const Text('Done', style: TextStyle(fontSize: 25))
                            : Text(TimerFormat.pomodoro(minute, second),
                                style: TextStyle(fontSize: 25)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: (iteration < 9)
                        ? const Text('30:00', style: TextStyle(fontSize: 25))
                        : (iteration > 9)
                            ? const Text('Done', style: TextStyle(fontSize: 25))
                            : Text(TimerFormat.pomodoro(minute, second),
                                style: TextStyle(fontSize: 25)),
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
                      child: const Text('Старт'))
                  : const Text('')
            ],
          ),
        ));
  }
}
