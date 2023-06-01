import 'package:flutter/material.dart';
import 'package:pomodoro_tracker/pages/main_page.dart';
import 'package:pomodoro_tracker/pages/note_list_page.dart';
import 'package:pomodoro_tracker/pages/pomodoro_page.dart';
import 'package:pomodoro_tracker/pages/timer_page.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => MainPage(),
    '/timer': (context) => TimerPage(),
    '/note_list': (context) => NoteListPage(),
    '/pomodoro': (context) => PomodoroPage()
  },
));
