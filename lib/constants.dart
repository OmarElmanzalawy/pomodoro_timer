import 'package:flutter/material.dart';
const Color kYellow = Color(0xfff7c702);
const Color kPicYellow = Color(0xffe8c303);
const Color kActiveStreak = Color(0xffff4d32);
const Color kInactiveStreak = Colors.black;
const double kStreakSize = 45;
//const EdgeInsets kStreakPadding = EdgeInsets.only(right: 8);
EdgeInsets kStreakPadding = EdgeInsets.only(right: 12);
const LinearGradient kBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [kYellow, Color(0xfff7a300)]);
const TextStyle kWhiteHeader =
    TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400);
const TextStyle kWhiteBody =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400);
const TextStyle kWhiteTitle =
    TextStyle(color: Colors.white70, fontSize: 35, fontWeight: FontWeight.w400);
const TextStyle kBlackHeader =
    TextStyle(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.w400);
const TextStyle kBlackTitle =
    TextStyle(color: Colors.black87, fontSize: 35, fontWeight: FontWeight.w400);
const TextStyle kYellowBody = TextStyle(color: kYellow, fontSize: 18, fontWeight: FontWeight.w400);


//TODO: PICK A BETTER WHITE COLOR THAN COLORS.WHITE BEC ITS TOO BRIGHT