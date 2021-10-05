import 'package:flutter/material.dart';

class FadedTitle extends StatelessWidget {
  final Widget child;
  const FadedTitle({ Key? key,required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 1),
      child: child,
      tween: Tween<double>(begin: 0,end: 1),
      builder: (BuildContext context,double val,Widget? child){
        return Opacity(
          opacity: val,
          child: Padding(
            padding: EdgeInsets.only(top: val*20),
            child: child,
          ),
        );
      },
    );
  }
}