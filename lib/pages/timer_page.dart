import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_tracker/widgets/time_picker.dart';
import 'package:pomodoro_tracker/widgets/timer_format.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late Timer _timer;
  late AudioPlayer audioPlayer = AudioPlayer();

  bool isTimerWork = false;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else if (minutes > 0) {
          seconds = 59;
          minutes--;
        } else if (hours > 0) {
          seconds = 59;
          minutes = 59;
          hours--;
        } else {
          isTimerWork = false;
          _timer.cancel();

          audioPlayer.play(AssetSource('sounds/timer_done_sound.mp3'));
          audioPlayer.onPlayerComplete.listen((event) {
            audioPlayer.play(AssetSource('sounds/timer_done_sound.mp3'));
          });

          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Время подошло к концу'),
                  content: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: OutlinedButton(
                      onPressed: () {
                        audioPlayer.stop();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Понятно'),
                    ),
                  ),
                );
              });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Таймер'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              isTimerWork
                  ? Text(TimerFormat.timer(hours, minutes, seconds),
                      style: const TextStyle(fontSize: 40))
                  : TimePickerSpinner(
                      isShowSeconds: true,
                      onTimeChange: (time) {
                        setState(() {
                          hours = time.hour;
                          minutes = time.minute;
                          seconds = time.second;
                        });
                      }),
              isTimerWork
                  ? const Text('')
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                isTimerWork = true;
                              });
                              _startTimer();
                            },
                            child: const Text('Старт')),
                        OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/', (route) => false);
                            },
                            child: const Text('Назад'))
                      ],
                    )
            ],
          ),
        ));
  }
}
