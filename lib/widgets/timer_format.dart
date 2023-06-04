class TimerFormat {
  static pomodoro(int minutes, int seconds) {
    String minutesString = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsString = (seconds < 10) ? '0$seconds' : '$seconds';
    return '$minutesString:$secondsString';
  }

  static timer(int hours, int minutes, int seconds) {
    String hoursString = (hours < 10) ? '0$hours' : '$hours';
    String minutesString = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsString = (seconds < 10) ? '0$seconds' : '$seconds';
    return '$hoursString:$minutesString:$secondsString';
  }
}
