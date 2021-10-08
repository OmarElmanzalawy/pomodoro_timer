import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/constants.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:pomodoro_timer/globals.dart';
import 'package:pomodoro_timer/shared/rounded_iconbutton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pomodoro_timer/shared/streak.dart';

enum TimerStatus {
  //didn't start yet
  stopped,
  //started but didn't finish
  running,
  //paused
  paused,
  //finished
  finished,
}

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final CountDownController timerController = CountDownController();
  TimerStatus timerStatus = TimerStatus.stopped;
  IconData playTimerIcon = Icons.play_arrow;
  List<Streak> streakIcons = [
    //TODO: Implement streaks in its separate class
    Streak(),
    Streak(),
    Streak(),
    Streak(),
  ];
  bool nextStreakisBugged = false;
  int finishedStreaks = 0;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[850]),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          sessionName!,
          style: TextStyle(
              color: Colors.grey[850],
              fontSize: 25,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/background3.jpg'),
            ),
            // gradient: LinearGradient(
            //   begin: Alignment.bottomCenter,
            //   end: Alignment.topCenter,
            //   colors: [Color(0xfff7a300),kYellow, ]
            // ),
          ),
        ),
        Column(children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenSize.height * 0.12,
                bottom: screenSize.height * 0.05),
            child: NeonCircularTimer(
              width: screenSize.width * 0.8,
              neonColor: kYellow,
              duration:  30, // Duration(minutes: sessionTime).inSeconds, //TODO: USE THIS AFTER FINISHING IMPLEMENTING STREAKS
              backgroudColor: Colors.red.withOpacity(0.2),
              controller: timerController,
              neumorphicEffect: false,
              textStyle: kBlackTitle,
              autoStart: false,
              strokeWidth: 20,
              neon: 2,
              isReverseAnimation: true,
              isReverse: true,
              outerStrokeColor: kYellow,
              strokeCap: StrokeCap.square,
              innerFillColor: Colors.grey.shade900,
              onComplete: () {
                setState(() {
                  //TODO: PLAY AUDIO WHEN TIMER FINISHES              
                });
                streakIcons[finishedStreaks] = Streak(status: StreakStatus.finished);
                finishedStreaks +=1;
                timerStatus = TimerStatus.finished;
                playTimerIcon = Icons.play_arrow;   
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: streakIcons,
          ),
          SizedBox(
            height: screenSize.height * 0.1,
          ),
          //Button to start timer
          RoundedIconButton(
              icon: playTimerIcon,
              iconColor: Colors.white,
              circleColor: Colors.black87,
              onpressed: () {
                setState(() {
                  if (timerStatus == TimerStatus.stopped &&
                      timerController.getTimeInSeconds() == 0) {
                    timerController.start();
                    playTimerIcon = Icons.pause;
                    timerStatus = TimerStatus.running;
                  } else if (timerController.getTimeInSeconds() > 0 &&
                      timerStatus == TimerStatus.running) {
                    timerController.pause();
                    playTimerIcon = Icons.play_arrow;
                    timerStatus = TimerStatus.paused;
                  } else if (timerStatus == TimerStatus.paused) {
                    timerController.resume();
                    playTimerIcon = Icons.pause;
                    timerStatus = TimerStatus.running;
                  }
                  else if (timerStatus == TimerStatus.finished){
                    timerController.start();
                    playTimerIcon = Icons.pause;
                    timerStatus = TimerStatus.running;
                  }
                });
              }),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          //Button to reset timer
          RoundedIconButton(
              icon: Icons.replay,
              iconColor: Colors.white,
              circleColor: Colors.black87,
              onpressed: () {
                setState(() {
                  timerController.restart();
                  // timerController.pause();
                  playTimerIcon = Icons.pause;
                  timerStatus = TimerStatus.running;
                });
              }),
        ]),
      ]),
    );
  }
}

//TODO: MAKE ROUNDEDICONS BIGGER
//TODO: FIND A SUITABLE BACKGROUND
//TODO: IMPLEMENT STREAKS LOGIC
//TODO: ANIMATE FLAME ICON JUST LIKE THE HEART TUTORIAL VIDEO
