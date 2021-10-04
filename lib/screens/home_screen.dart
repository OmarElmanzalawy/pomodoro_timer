// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '/constants.dart';
import '/widgets/card.dart';
import '/globals.dart' as globals;
import 'package:numberpicker/numberpicker.dart';
import 'package:pomodoro_timer/screens/timer_screen.dart';

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
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                  title: Text(
                    'Pomodoro Timer',
                    style: kBlackTitle,
                  ),
                  trailing: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade900,
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Timer(),));
                              //TODO: IMPLEMENT DONE LOGIC
                            },
                            icon: Icon(
                              Icons.done_all,
                              color: Colors.white70,
                            )),
                      ),
                    ],
                  ),
                  ),
                ),
                Column(
                  children: [
                    CircularContainer(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: screenSize.width,
                      height: 150,
                      color: Colors.grey.shade900,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 15),
                              child: Text(
                                'Name of session:',
                                style: kWhiteHeader,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
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
                      margin: EdgeInsets.only(
                          right: 20, left: 20, top: 10, bottom: 10),
                      width: screenSize.width,
                      height: 200,
                      color: Colors.grey.shade900,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircularContainer(
                          margin: EdgeInsets.only(left: 20, right: 0),
                          width: 200,
                          height: 200,
                          color: Colors.grey.shade900,
                          child: Column(
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
                        Expanded(
                          child: CircularContainer(
                            margin: EdgeInsets.only(left: 10, right: 0),
                            width: 200,
                            height: 200,
                            color: Colors.grey.shade900,
                            child: Column(
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

//TODO: IMPLEMENT TWEENANIMATIONBUILDER TO FADE TITLE TEXT AND PADDING