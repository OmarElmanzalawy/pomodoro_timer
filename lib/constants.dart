import 'package:flutter/material.dart';
const Color kYellow = Color(0xfff7c702);
const LinearGradient kBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [kYellow, Color(0xfff7a300)]);
const TextStyle kWhiteHeader =
    TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400);
const TextStyle kWhiteBody =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400);
const TextStyle kWhiteTitle =
    TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w400);
const TextStyle kBlackHeader =
    TextStyle(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.w400);
const TextStyle kBlackTitle =
    TextStyle(color: Colors.black87, fontSize: 35, fontWeight: FontWeight.w400);
const TextStyle kYellowBody = TextStyle(color: kYellow, fontSize: 18, fontWeight: FontWeight.w400);