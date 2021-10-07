// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:pomodoro_timer/shared/card.dart';
import 'package:pomodoro_timer/shared/faded_title.dart';
import '/globals.dart' as globals;
import 'package:numberpicker/numberpicker.dart';
import 'package:pomodoro_timer/screens/timer_screen.dart';
import 'package:pomodoro_timer/shared/rounded_iconbutton.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(gradient: kBackgroundGradient),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical:screenSize.width*0.05,horizontal: screenSize.height*0.02),
                  child: FadedTitle(                 
                    child: ListTile(
                    title: Text(
                      'Pomodoro Timer',
                      style: kBlackTitle,
                    ),
                    trailing: RoundedIconButton(
                      icon: Icons.done_all,
                      onpressed: (){
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Timer(),
                    ));
                      },
                    ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    CircularContainer(
                      margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.05),
                      width: screenSize.width,
                      height: screenSize.height *0.18,
                      color: Colors.grey.shade900,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: screenSize.height*0.02,left: screenSize.width*0.045),
                              child: Text(
                                'Name of session:',
                                style: kWhiteHeader,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenSize.width*0.045),
                            child: TextField(
                              controller: nameController,
                              style: kWhiteBody,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'name',
                                labelStyle:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.close, color: Colors.grey),
                                  onPressed: () => nameController.clear(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircularContainer(
                      margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.05,vertical: screenSize.height*0.025),
                      width: screenSize.width,
                      height: screenSize.height*0.27,
                      color: Colors.grey.shade900,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(screenSize.width*0.045),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Session Time',
                                  style: kWhiteHeader,
                                )),
                          ),
                          Expanded(
                            child: NumberPicker(
                              maxValue: 60,
                              minValue: 25,
                              itemHeight: 40,
                              step: 5,
                              axis: Axis.horizontal,
                              haptics: false,
                              value: globals.sessionTime,
                              textStyle: kWhiteBody,
                              selectedTextStyle: kYellowBody,
                              onChanged: (value) {
                                setState(() {});
                                globals.sessionTime = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircularContainer(
                          margin: EdgeInsets.only(left: screenSize.width*0.05, right: 0),
                          width: screenSize.width*0.45,
                          height: screenSize.height*0.3,
                          color: Colors.grey.shade900,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text('Short break', style: kWhiteHeader),
                              ),
                              NumberPicker(
                                value: globals.shortBreak,
                                minValue: 5,
                                maxValue: 10,
                                step: 1,
                                selectedTextStyle: kYellowBody,
                                textStyle: kWhiteBody,
                                onChanged: (value) {
                                  setState(() {});
                                  globals.shortBreak = value;
                                },
                              ),
                            ],
                          ),
                        ),
                        CircularContainer(
                          margin: EdgeInsets.only(left: screenSize.width*0.05,right: 0),
                          width: screenSize.width*0.45,
                          height: screenSize.height*0.3,
                          color: Colors.grey.shade900,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child:
                                    Text('Long break', style: kWhiteHeader),
                              ),
                              NumberPicker(
                                value: globals.longBreak,
                                minValue: 10,
                                maxValue: 20,
                                step: 1,
                                selectedTextStyle: kYellowBody,
                                textStyle: kWhiteBody,
                                onChanged: (value) {
                                  setState(() {});
                                  globals.longBreak = value;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

//TODO: ADD AUDIO WHEN BUTTONS ARE PRESSED