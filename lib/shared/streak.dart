import 'package:flutter/material.dart';
import 'package:pomodoro_timer/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pomodoro_timer/constants.dart';
import 'package:pomodoro_timer/globals.dart';

enum StreakStatus {
  finished,
  unfinshed
}

class Streak extends StatefulWidget {
  StreakStatus? status = StreakStatus.unfinshed;
  Streak({ Key? key,this.status, }) : super(key: key);
  @override
  State<Streak> createState() => _StreakState();
}

class _StreakState extends State<Streak> with SingleTickerProviderStateMixin {

  AnimationController? _animationController;
  Animation<Color?>? _colorAnimation;
  Animation<double?>? _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 600));
    _colorAnimation = ColorTween(begin: kInactiveStreak, end: kActiveStreak).animate(_animationController!);
    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>> [
        TweenSequenceItem<double> (tween: Tween(begin: kStreakSize,end: 65),weight: 65),
        TweenSequenceItem<double> (tween: Tween(begin: 65,end: kStreakSize),weight: 65),
      ]
    ).animate(_animationController!);

    _animationController!.forward();

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder:(BuildContext context,_) {
        return FaIcon(
        FontAwesomeIcons.burn, 
        color: widget.status == StreakStatus.finished ? _colorAnimation!.value : kInactiveStreak, 
        size: widget.status == StreakStatus.finished ? _sizeAnimation!.value : kStreakSize
        );
      }
    );
  }
}

//TODO: FIX ANIMATIONS