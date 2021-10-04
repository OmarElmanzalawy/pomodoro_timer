import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {

  final double width;
  final double height;
  final Color color;
  final Widget child;
  final EdgeInsets? margin;

  CircularContainer({required this.width,required this.height,required this.child,required this.color,this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: margin ?? EdgeInsets.zero,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(18)
      ),
    );
  }
}