import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro_tracker/utils/time_picker.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late Timer _timer;

  bool _isTimerWork = false;
  int _hour = 0;
  int _minute = 0;
  int _second = 0;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_second > 0) {
          _second--;
        } else if (_minute > 0) {
          _second = 59;
          _minute--;
        } else if (_hour > 0) {
          _second = 59;
          _minute = 59;
          _hour--;
        } else {
          _isTimerWork = false;
          _timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
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
              _isTimerWork
                  ? Text('$_hour:$_minute:$_second',
                      style: const TextStyle(fontSize: 20))
                  : TimePickerSpinner(
                      isShowSeconds: true,
                      onTimeChange: (time) {
                        setState(() {
                          _hour = time.hour;
                          _minute = time.minute;
                          _second = time.second;
                        });
                      }),
              _isTimerWork
                  ? const Text('')
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _isTimerWork = true;
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
