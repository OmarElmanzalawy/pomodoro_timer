import 'package:flutter/material.dart';
import 'package:pomodoro_timer/constants.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final CountDownController clockController = CountDownController();
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;   
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/editedvase.jpg'),
            ),
          ),
        ),
        Column(
          children:[
            Padding(
              padding: EdgeInsets.only(top: screenSize.height*0.18),
              child: NeonCircularTimer(
                width: screenSize.width*0.5,
                backgroudColor: Colors.black,
                neonColor: Colors.white,
                duration: 20,
                controller: clockController,
                outerStrokeColor: Colors.amberAccent.shade700,
                neumorphicEffect: false,
                autoStart: false,
                strokeWidth: 15,
                innerFillColor: Colors.amberAccent.shade700,
              ),
              ),
            ]
          ),
        ]
      ),
    );
  }
}

//TODO: Bring Vase down in photoshop
//TODO: Create another color variant of the photo in photoshop
//TODO: IMPLEMENT PAGE