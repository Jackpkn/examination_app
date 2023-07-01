// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:examination_app/src/models/question_model.dart';
import 'package:examination_app/src/screens/test_overview/screens/test_overview.dart';
import 'package:examination_app/src/widgets/app_style.dart';
import 'package:examination_app/src/widgets/elevated_button.dart';
import 'package:examination_app/src/widgets/global_container.dart';
import 'package:examination_app/src/widgets/gridview.dart';
import 'package:examination_app/src/widgets/reusable_text.dart';

import '../models/subject_type.dart';

class TestLending extends StatefulWidget {
  const TestLending({super.key});

  @override
  State<TestLending> createState() => _TestLendingState();
}

class _TestLendingState extends State<TestLending> {
  bool scoreSelected = true;
  bool physicsSelected = true;
  bool chemistrySelected = true;
  bool mathematicsSelected = true;
  Timer? timer;
  String jack = '';
  bool isCountDown = true;
  Duration duration = const Duration();
  static const countDown = Duration(minutes: 10);
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  late PageController _controller;
  String btnText = "Next Question";
  bool answered = false;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        jack =
            "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
      });
    });
    _controller = PageController(initialPage: 0);
  }

  void reset() {
    if (isCountDown) {
      setState(() {
        duration = countDown;
      });
    } else {
      setState(() {
        duration = const Duration();
      });
    }
  }

  void addTimer() {
    final addSeconds = isCountDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => addTimer(),
    );
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      TestOver(controller: _controller,),
      TestOver(controller: _controller),
      TestOver(controller: _controller),
    ];
    return SafeArea(
      child: Scaffold(
          endDrawer: Drawer(
            backgroundColor: const Color.fromARGB(255, 207, 202, 202),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // const SizedBox(height: 14,),
                    const GlobalContainer(
                      height: 50,
                      width: double.infinity,
                      color: Colors.blue,
                      child: Text(
                        'Exam Name',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GlobalContainer(
                                height: 25,
                                width: 26,
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.green,
                                child: const Text(''),
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              ReusableText(
                                text: 'Attempted',
                                textStyle: appStyle(
                                  fw: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GlobalContainer(
                                height: 25,
                                width: 26,
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                                child: const Text(''),
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              ReusableText(
                                text: 'Not Visited             ',
                                textStyle: appStyle(
                                  fw: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const AttempedPart(),
                    GlobalContainer(
                      height: 80,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: ReusableText(
                                text: 'Test Summary',
                                textStyle: appStyle(
                                    fw: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    GlobalContainer(
                      height: physicsSelected ? 55 : 294,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 226, 219, 219),
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: physicsSelected
                            ? Pattern(
                                onTap: () {
                                  setState(() {
                                    physicsSelected = !physicsSelected;
                                  });
                                },
                                subjectType: 'Physics',
                                icon: Icons.arrow_drop_up,
                              )
                            : Column(
                                children: [
                                  Pattern(
                                    onTap: () {
                                      setState(() {
                                        physicsSelected = !physicsSelected;
                                      });
                                    },
                                    subjectType: 'Physics',
                                    icon: Icons.arrow_drop_down,
                                  ),
                                  const Divider(
                                    thickness: 1.6,
                                  ),
                                  Expanded(
                                    child: DrawerGridView(
                                      itemCount: 25,
                                      widget: GlobalContainer(
                                        width: 20,
                                        height: 20,
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        child: const Text(""),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    GlobalContainer(
                      height: chemistrySelected ? 55 : 294,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 226, 219, 219),
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: chemistrySelected
                            ? Pattern(
                                onTap: () {
                                  setState(() {
                                    chemistrySelected = !chemistrySelected;
                                  });
                                },
                                subjectType: 'Chemistry',
                                icon: Icons.arrow_drop_up,
                              )
                            : Column(
                                children: [
                                  Pattern(
                                    onTap: () {
                                      setState(() {
                                        chemistrySelected = !chemistrySelected;
                                      });
                                    },
                                    subjectType: 'Chemistry',
                                    icon: Icons.arrow_drop_down,
                                  ),
                                  const Divider(
                                    thickness: 1.6,
                                  ),
                                  Expanded(
                                    child: DrawerGridView(
                                      itemCount: 25,
                                      widget: GlobalContainer(
                                        width: 20,
                                        height: 20,
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        child: const Text(""),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GlobalContainer(
                      height: mathematicsSelected ? 55 : 294,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 226, 219, 219),
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: mathematicsSelected
                            ? Pattern(
                                onTap: () {
                                  setState(() {
                                    mathematicsSelected = !mathematicsSelected;
                                  });
                                },
                                subjectType: 'Mathematics',
                                icon: Icons.arrow_drop_up,
                              )
                            : Column(
                                children: [
                                  Pattern(
                                    onTap: () {
                                      setState(() {
                                        mathematicsSelected =
                                            !mathematicsSelected;
                                      });
                                    },
                                    subjectType: 'Mathematics',
                                    icon: Icons.arrow_drop_down,
                                  ),
                                  const Divider(
                                    thickness: 1.6,
                                  ),
                                  Expanded(
                                    child: DrawerGridView(
                                      itemCount: 25,
                                      widget: GlobalContainer(
                                        width: 20,
                                        height: 20,
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        child: const Text(""),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1.3,
                      color: Color.fromARGB(255, 57, 50, 50),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: GlobalContainer(
                            height: 30,
                            borderRadius: BorderRadius.circular(8),
                            width: double.infinity,
                            color: Colors.teal,
                            child: const Text(
                              'Submit Test',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(110),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              toolbarHeight: 70,
              centerTitle: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14)),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 7, 143, 255),
                      Color.fromARGB(255, 5, 133, 238)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Column(
                            children: [
                              ReusableText(
                                text: 'Exam Name',
                                textStyle: appStyle(
                                  fw: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              ReusableText(
                                text: 'Exam Type',
                                textStyle: appStyle(
                                  fw: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 23),
                              child: ReusableText(
                                text: jack,
                                textStyle: appStyle(
                                  fw: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 44,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: subjectName.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              child: GlobalContainer(
                                height: 30,
                                width: MediaQuery.of(context).size.width * 0.29,
                                color: currentIndex == index
                                    ? Colors.white
                                    : Colors.blue,
                                borderRadius: BorderRadius.circular(16),
                                child: ReusableText(
                                  text: subjectName[index].subjectName,
                                  textStyle: appStyle(
                                    fw: currentIndex == index
                                        ? FontWeight.bold
                                        : FontWeight.w400,
                                    fontSize: 16,
                                    color: currentIndex == index
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              list[currentIndex],
              Align(
                alignment: Alignment.bottomCenter,
                child: GlobalContainer(
                  height: 60,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        child: const Text('Mark & Next'),
                        onPressed: () {},
                      ),
                      Button(
                        child: const Text('clear'),
                        onPressed: () {},
                      ),
                      Button(
                        child: const Text('Save & Next'),
                        onPressed: () {
                          if (_controller.page?.toInt() ==
                              questions.length - 1) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const TestOverview(),
                              ),
                            );
                          } else {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 25),
                                curve: Curves.linear);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class AttempedPart extends StatelessWidget {
  const AttempedPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GlobalContainer(
                height: 25,
                width: 26,
                borderRadius: BorderRadius.circular(4),
                color: const Color.fromARGB(255, 150, 49, 49),
                child: const Text(''),
              ),
              const SizedBox(
                width: 9,
              ),
              ReusableText(
                text: 'Not Attempted',
                textStyle: appStyle(
                  fw: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Row(
            children: [
              GlobalContainer(
                height: 25,
                width: 26,
                borderRadius: BorderRadius.circular(4),
                color: const Color.fromARGB(255, 255, 156, 57),
                child: const Text(''),
              ),
              const SizedBox(
                width: 9,
              ),
              ReusableText(
                text: 'Marked for Review',
                textStyle: appStyle(
                  fw: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
// RichText(
//                                 text: TextSpan(
//                                     text:
//                                         "${questions[index].answers!.keys.toList()[i]}  ",
//                                     style:
//                                     appStyle(
//                                       fw: FontWeight.w500,
//                                       fontSize: 17,
//                                       color: Colors.black,
//                                     ),
//                                     children: [

//                                       TextSpan(
//                                         text: questions[index]
//                                             .answers!
//                                             .values
//                                             .toList()[i],
//                                         style: appStyle(
//                                           fw: FontWeight.w500,
//                                           fontSize: 13,
//                                           color: const Color.fromARGB(
//                                             255,
//                                             63,
//                                             57,
//                                             57,
//                                           ),
//                                         ),
//                                       )
//                                     ]),
//                               ),
class Pattern extends StatelessWidget {
  final String subjectType;
  final VoidCallback onTap;
  final IconData? icon;
  const Pattern({
    Key? key,
    required this.subjectType,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReusableText(
          text: subjectType,
          textStyle: appStyle(
            fw: FontWeight.bold,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GlobalContainer(
              height: 16,
              width: 17,
              borderRadius: BorderRadius.circular(4),
              color: Colors.green,
              child: const Text(''),
            ),
            GlobalContainer(
              height: 16,
              width: 17,
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              child: const Text(''),
            ),
            GlobalContainer(
              height: 16,
              width: 17,
              borderRadius: BorderRadius.circular(4),
              color: const Color.fromARGB(255, 154, 51, 44),
              child: const Text(''),
            ),
            GlobalContainer(
              height: 16,
              width: 17,
              borderRadius: BorderRadius.circular(4),
              color: const Color.fromARGB(255, 255, 156, 57),
              child: const Text(''),
            ),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                size: 35,
                icon,
              ),
            )
          ],
        )
      ],
    );
  }
}

class TestOver extends StatelessWidget {
  
  final PageController? controller;
  const TestOver({
    Key? key,
  
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60, top: 8, right: 8, left: 8),
      child: PageView.builder(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: questions.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                // height: 500,

                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 174, 178, 174),
                ),
                // borderRadius: const BorderRadius.only(
                //     topLeft: Radius.circular(15),
                //     topRight: Radius.circular(15)),

                child: Column(
                  children: [
                    GlobalContainer(
                      height: 50,
                      width: double.infinity,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: const Color.fromARGB(255, 174, 178, 174),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReusableText(
                              text: "Q. ${index + 1}/${questions.length}",
                              textStyle: appStyle(
                                fw: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            ReusableText(
                              text: 'Physics',
                              textStyle: appStyle(
                                fw: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              Icons.bookmark,
                              color: Colors.white,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          color: const Color.fromARGB(255, 209, 203, 203),
                          constraints: const BoxConstraints(
                            minHeight: 200,
                          ),
                          padding: const EdgeInsets.all(6),
                          width: double.infinity,
                          child: ReusableText(
                              text: questions[index].question.toString(),
                              textStyle: appStyle(
                                  fw: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.black)),
                        ),
                        const SizedBox(height: 13),
                        for (int i = 0;
                            i < questions[index].answers!.length;
                            i++)
                          Container(
                            // height: 55,
                            constraints: const BoxConstraints(minHeight: 55),
                            margin: const EdgeInsets.only(
                                bottom: 12.0, left: 12.0, right: 12.0),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 170, 161, 161),
                              ),
                            ),
                            width: 300,
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          Color.fromARGB(255, 171, 181, 186)),
                                  child: Text(questions[index]
                                      .answers!
                                      .keys
                                      .toList()[i]),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    questions[index]
                                        .answers!
                                        .values
                                        .toList()[i],
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
