import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Color? circleColor;
  final Color? iconColor;
  final VoidCallback onpressed;
  final IconData icon;

  RoundedIconButton({required this.onpressed,required this.icon,this.iconColor,this.circleColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:  circleColor ?? Colors.grey.shade900,
          ),
          child: IconButton(
              onPressed: onpressed,
              icon: Icon(
                icon,
                color: iconColor ?? Colors.white70,
              )),
        ),
      ],
    );
  }
}

//TOO: Implement ability to change size of icon