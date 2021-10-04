import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'constants.dart';
void main() {
  runApp(const PomodoroTimer());
}

class PomodoroTimer extends StatelessWidget {
  const PomodoroTimer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      theme: ThemeData(
        scaffoldBackgroundColor: kYellow
      ),
      home: HomeScreen(),
    );
  }
}
