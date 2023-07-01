// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:examination_app/src/widgets/app_style.dart';
import 'package:examination_app/src/widgets/custom_appbar.dart';
import 'package:examination_app/src/widgets/reusable_text.dart';

import '../../../models/subject_type.dart';
import '../../../widgets/global_container.dart';
import '../widgets/usable_drop_down.dart';

class TestOverview extends StatefulWidget {
  const TestOverview({super.key});

  @override
  State<TestOverview> createState() => _TestOverviewState();
}

class _TestOverviewState extends State<TestOverview>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  String dropdown = '';

  @override
  void initState() {
    data = [
      _ChartData('Phy', 46),
      _ChartData('Chem', 65),
      _ChartData('Mat', 30),
    ];
    data1 = [
      _ChartData('Phy', 8),
      _ChartData('Chem', 21),
      _ChartData('Mat', 15),
    ];

    _tooltip = TooltipBehavior(
        enable: true,
        elevation: 4,
        textStyle: const TextStyle(color: Color.fromARGB(255, 77, 7, 255)));
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  late List<_ChartData> data;
  late List<_ChartData> data1;
  late TooltipBehavior _tooltip;

  // bool isSelected = false;
  bool scoreSelected = true;
  bool attemptSelected = true;
  bool timeSelected = true;
  bool accuracySelected = true;
  bool rankSelected = true;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 216, 207, 207),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: CustomAppbar(
            child: Text(
              'TEST OVERVIEW',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _controller,
                dividerColor: Colors.blue,
                indicatorColor: Colors.blue,
                tabs: const [
                  Tab(
                    // icon: Icon(Icons.home),
                    text: 'Overall',
                  ),
                  Tab(
                    // icon: Icon(Icons.my_location),
                    text: 'Solutions',
                  ),
                  Tab(
                    // icon: Icon(Icons.my_location),
                    text: 'Leaderboard',
                  ),
                ],
              ),
              SizedBox(
                height: 2700,
                child: TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 5,
                              child: GlobalContainer(
                                height: scoreSelected ? 50 : 400,
                                width: double.infinity,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 9),
                                  child: scoreSelected
                                      ? UsableDropDown(
                                          title: "Score",
                                          titleIcon: Icons.speed,
                                          subtitle1: "100/",
                                          subtitle2: "300",
                                          callback: () {
                                            setState(() {
                                              scoreSelected = !scoreSelected;
                                            });
                                          },
                                          icon:
                                              Icons.keyboard_arrow_down_rounded,
                                        )
                                      : Column(
                                          children: [
                                            UsableDropDown(
                                              title: "Score",
                                              titleIcon: Icons.speed,
                                              subtitle1: "100/",
                                              subtitle2: "300",
                                              callback: () {
                                                setState(() {
                                                  scoreSelected =
                                                      !scoreSelected;
                                                });
                                              },
                                              icon: Icons
                                                  .keyboard_arrow_up_rounded,
                                            ),
                                            const ScoreType(
                                              scoreType: 'Positive Score',
                                              score: '115',
                                            ),
                                            const ScoreType(
                                              scoreType: 'Negative Score',
                                              score: '25',
                                            ),
                                            SfCartesianChart(
                                              primaryXAxis: CategoryAxis(),
                                              margin: const EdgeInsets.all(10),
                                              primaryYAxis: NumericAxis(
                                                  rangePadding:
                                                      ChartRangePadding.none,
                                                  minimum: 0,
                                                  maximum: 100,
                                                  interval: 25),
                                              tooltipBehavior: _tooltip,
                                              series: <ChartSeries<_ChartData,
                                                  String>>[
                                                BarSeries<_ChartData, String>(
                                                  width: 0.2,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  4),
                                                          topRight:
                                                              Radius.circular(
                                                                  4)),
                                                  dataSource: data1,
                                                  xValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.y,
                                                  name: 'Gold',
                                                  color: Colors.red,
                                                ),
                                                BarSeries<_ChartData, String>(
                                                  width: 0.2,
                                                  dataSource: data,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  4),
                                                          topRight:
                                                              Radius.circular(
                                                                  4)),
                                                  xValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.y,
                                                  name: 'Gold',
                                                  color: Colors.green,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Card(
                              elevation: 5,
                              child: GlobalContainer(
                                height: attemptSelected ? 50 : 350,
                                width: double.infinity,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 9),
                                  child: attemptSelected
                                      ? UsableDropDown(
                                          title: "Attempted",
                                          titleIcon:
                                              Icons.verified_user_outlined,
                                          subtitle1: "56",
                                          subtitle2: "/75",
                                          callback: () {
                                            setState(() {
                                              attemptSelected =
                                                  !attemptSelected;
                                            });
                                          },
                                          icon:
                                              Icons.keyboard_arrow_down_rounded,
                                        )
                                      : Column(
                                          children: [
                                            UsableDropDown(
                                              title: "Attempted",
                                              titleIcon:
                                                  Icons.verified_user_outlined,
                                              subtitle1: "56",
                                              subtitle2: "/75",
                                              callback: () {
                                                setState(() {
                                                  attemptSelected =
                                                      !attemptSelected;
                                                });
                                              },
                                              icon: Icons
                                                  .keyboard_arrow_up_rounded,
                                            ),
                                            SfCartesianChart(
                                              isTransposed: true,
                                              primaryXAxis: CategoryAxis(),
                                              margin: const EdgeInsets.all(20),
                                              primaryYAxis: NumericAxis(
                                                  rangePadding:
                                                      ChartRangePadding.none,
                                                  minimum: 0,
                                                  maximum: 30,
                                                  interval: 10),
                                              tooltipBehavior: _tooltip,
                                              series: <ChartSeries<_ChartData,
                                                  String>>[
                                                BarSeries<_ChartData, String>(
                                                  width: 0.2,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  4),
                                                          topRight:
                                                              Radius.circular(
                                                                  4)),
                                                  dataSource: data1,
                                                  xValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.y,
                                                  name: 'Gold',
                                                  color: Colors.blueAccent,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 5,
                              child: GlobalContainer(
                                height: timeSelected ? 50 : 290,
                                width: double.infinity,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 9),
                                  child: timeSelected
                                      ? UsableDropDown(
                                          title: "Time",
                                          titleIcon: Icons.timer_outlined,
                                          subtitle1: "1m 16s",
                                          subtitle2: "",
                                          callback: () {
                                            setState(() {
                                              timeSelected = !timeSelected;
                                            });
                                          },
                                          icon:
                                              Icons.keyboard_arrow_down_rounded,
                                        )
                                      : Column(
                                          children: [
                                            UsableDropDown(
                                              title: "Time",
                                              titleIcon: Icons.timer_outlined,
                                              subtitle1: "1m 16s",
                                              subtitle2: "",
                                              callback: () {
                                                setState(() {
                                                  timeSelected = !timeSelected;
                                                });
                                              },
                                              icon: Icons
                                                  .keyboard_arrow_down_rounded,
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: ReusableText(
                                                text: 'Avg, time per question',
                                                textStyle: appStyle(
                                                    color: Colors.grey,
                                                    fontSize: 19,
                                                    fw: FontWeight.w500),
                                              ),
                                            ),
                                            const SizedBox(height: 42),
                                            SizedBox(
                                              height: 140,
                                              width: double.infinity,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: SfCircularChart(
                                                      legend: const Legend(
                                                        itemPadding: 16,
                                                        isVisible: true,
                                                      ),
                                                      palette: const [
                                                        Colors.teal,
                                                        Colors.blue,
                                                        Colors.red,
                                                      ],
                                                      tooltipBehavior: _tooltip,
                                                      series: <CircularSeries<
                                                          dynamic, dynamic>>[
                                                        DoughnutSeries<
                                                            _ChartData, String>(
                                                          radius: '80',
                                                          innerRadius: '60',
                                                          legendIconType:
                                                              LegendIconType
                                                                  .circle,
                                                          dataSource: data,
                                                          xValueMapper:
                                                              (_ChartData data,
                                                                      _) =>
                                                                  data.x,
                                                          yValueMapper:
                                                              (_ChartData data,
                                                                      _) =>
                                                                  data.y,
                                                          name: 'Gold',
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      const SizedBox(
                                                          height: 18),
                                                      ReusableText(
                                                          text: '57min',
                                                          textStyle: appStyle(
                                                            fw: FontWeight.w400,
                                                            fontSize: 16,
                                                            color: Colors.teal,
                                                          )),
                                                      const SizedBox(
                                                          height: 14),
                                                      ReusableText(
                                                          text: '48min',
                                                          textStyle: appStyle(
                                                            fw: FontWeight.w400,
                                                            fontSize: 16,
                                                            color: Colors.blue,
                                                          )),
                                                      const SizedBox(
                                                          height: 14),
                                                      ReusableText(
                                                        text: '57min',
                                                        textStyle: appStyle(
                                                          fw: FontWeight.w400,
                                                          fontSize: 16,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Card(
                              elevation: 5,
                              child: GlobalContainer(
                                height: accuracySelected ? 50 : 379,
                                width: double.infinity,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 9),
                                  child: accuracySelected
                                      ? UsableDropDown(
                                          title: "Accuracy",
                                          titleIcon: Icons.speed,
                                          subtitle1: "26.9%",
                                          subtitle2: "",
                                          callback: () {
                                            setState(() {
                                              accuracySelected =
                                                  !accuracySelected;
                                            });
                                          },
                                          icon:
                                              Icons.keyboard_arrow_down_rounded,
                                        )
                                      : Column(
                                          children: [
                                            UsableDropDown(
                                              title: "Accuracy",
                                              titleIcon: Icons.speed,
                                              subtitle1: "26.9%",
                                              subtitle2: "",
                                              callback: () {
                                                setState(() {
                                                  accuracySelected =
                                                      !accuracySelected;
                                                });
                                              },
                                              icon: Icons
                                                  .keyboard_arrow_up_rounded,
                                            ),
                                            const IntrinsicHeight(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Column(
                                                    children: [
                                                      GlobalContainer(
                                                        height: 9,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  4),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  4),
                                                        ),
                                                        width: 66,
                                                        color: Colors.blue,
                                                        child: Text(''),
                                                      ),
                                                      Text('Attempted')
                                                    ],
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.black,
                                                    thickness: 2,
                                                  ),
                                                  Column(
                                                    children: [
                                                      GlobalContainer(
                                                        height: 9,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                            4,
                                                          ),
                                                          bottomRight:
                                                              Radius.circular(
                                                            4,
                                                          ),
                                                        ),
                                                        width: 66,
                                                        color: Colors.green,
                                                        child: Text(''),
                                                      ),
                                                      Text('Correct')
                                                    ],
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.black,
                                                    thickness: 2,
                                                  ),
                                                  Column(
                                                    children: [
                                                      GlobalContainer(
                                                        height: 9,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  4),
                                                          bottomRight:
                                                              Radius.circular(
                                                            4,
                                                          ),
                                                        ),
                                                        width: 66,
                                                        color: Colors.red,
                                                        child: Text(''),
                                                      ),
                                                      Text('Wrong')
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SfCartesianChart(
                                              isTransposed: true,
                                              primaryXAxis: CategoryAxis(),
                                              margin: const EdgeInsets.all(20),
                                              primaryYAxis: NumericAxis(
                                                  rangePadding:
                                                      ChartRangePadding.none,
                                                  minimum: 0,
                                                  maximum: 30,
                                                  interval: 10),
                                              tooltipBehavior: _tooltip,
                                              series: <ChartSeries<_ChartData,
                                                  String>>[
                                                BarSeries<_ChartData, String>(
                                                  width: 0.2,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  4),
                                                          topRight:
                                                              Radius.circular(
                                                                  4)),
                                                  dataSource: data1,
                                                  xValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.y,
                                                  name: 'Gold',
                                                  color: Colors.blueAccent,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 5,
                              child: GlobalContainer(
                                height: rankSelected ? 50 : 360,
                                width: double.infinity,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 9),
                                  child: rankSelected
                                      ? UsableDropDown(
                                          title: "Rank",
                                          titleIcon: Icons.auto_awesome_sharp,
                                          subtitle1: "127",
                                          subtitle2: "/816",
                                          callback: () {
                                            setState(() {
                                              rankSelected = !rankSelected;
                                            });
                                          },
                                          icon:
                                              Icons.keyboard_arrow_down_rounded,
                                        )
                                      : Column(
                                          children: [
                                            UsableDropDown(
                                              title: "Rank",
                                              titleIcon:
                                                  Icons.auto_awesome_sharp,
                                              subtitle1: "127",
                                              subtitle2: "/816",
                                              callback: () {
                                                setState(() {
                                                  rankSelected = !rankSelected;
                                                });
                                              },
                                              icon: Icons
                                                  .keyboard_arrow_up_rounded,
                                            ),
                                            Container(
                                              color: Colors.green,
                                              width: 100,
                                              height: 40,
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ReusableText(
                              text: 'Subject - Wise Report',
                              textStyle: appStyle(
                                fw: FontWeight.w300,
                                fontSize: 18,
                                color: Colors.blueGrey,
                              ),
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
                                          selectedIndex = index;
                                        });
                                      },
                                      child: GlobalContainer(
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.28,
                                        color: const Color.fromARGB(
                                            255, 9, 71, 205),
                                        borderRadius: BorderRadius.circular(10),
                                        child: Text(
                                          subjectName[index].subjectName,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GlobalContainer(
                              height: 310,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.speed,
                                            color: Colors.teal),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 9),
                                              child: ReusableText(
                                                text: 'Score',
                                                textStyle: appStyle(
                                                  fw: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            LinearPercentIndicator(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.70,
                                              lineHeight: 5.0,
                                              barRadius:
                                                  const Radius.circular(7),
                                              percent: 0.5,
                                              backgroundColor: Colors.grey,
                                              progressColor: Colors.teal,
                                            ),
                                          ],
                                        ),
                                        const Text('25/100'),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.verified_user_outlined,
                                            color: Colors.orange),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 9),
                                              child: ReusableText(
                                                text: 'Accuracy',
                                                textStyle: appStyle(
                                                  fw: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            LinearPercentIndicator(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.70,
                                              lineHeight: 5.0,
                                              barRadius:
                                                  const Radius.circular(7),
                                              percent: 0.15,
                                              backgroundColor: Colors.grey,
                                              progressColor: Colors.orange,
                                            ),
                                          ],
                                        ),
                                        ReusableText(
                                          text: '23.9%',
                                          textStyle: appStyle(
                                            fw: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.timer_outlined,
                                                color: Colors.red),
                                            const SizedBox(
                                              width: 9,
                                            ),
                                            ReusableText(
                                              text: 'Time Take',
                                              textStyle: appStyle(
                                                fw: FontWeight.bold,
                                                fontSize: 17,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        ReusableText(
                                          text: '54m 16s',
                                          textStyle: appStyle(
                                            fw: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 17,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: ReusableText(
                                        text: 'Total question: 30',
                                        textStyle: appStyle(
                                          fw: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 19),
                                    SizedBox(
                                      // color: Colors.pink,
                                      height: 127,
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: SfCircularChart(
                                              legend: const Legend(
                                                itemPadding: 16,
                                                isVisible: true,
                                              ),
                                              palette: const [
                                                Colors.teal,
                                                Colors.blue,
                                                Colors.red,
                                              ],
                                              tooltipBehavior: _tooltip,
                                              series: <CircularSeries<dynamic,
                                                  dynamic>>[
                                                DoughnutSeries<_ChartData,
                                                    String>(
                                                  radius: '50',
                                                  innerRadius: '30',
                                                  legendIconType:
                                                      LegendIconType.circle,
                                                  dataSource: data,
                                                  xValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.y,
                                                  name: 'Gold',
                                                )
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              const SizedBox(height: 10),
                                              ReusableText(
                                                  text: '11',
                                                  textStyle: appStyle(
                                                    fw: FontWeight.w400,
                                                    fontSize: 16,
                                                    color: Colors.teal,
                                                  )),
                                              const SizedBox(height: 14),
                                              ReusableText(
                                                  text: '10',
                                                  textStyle: appStyle(
                                                    fw: FontWeight.w400,
                                                    fontSize: 16,
                                                    color: Colors.blue,
                                                  )),
                                              const SizedBox(height: 14),
                                              ReusableText(
                                                text: '9',
                                                textStyle: appStyle(
                                                  fw: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ReusableText(
                              text: 'Comparison',
                              textStyle: appStyle(
                                fw: FontWeight.w300,
                                fontSize: 18,
                                color: Colors.blueGrey,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GlobalContainer(
                              height: 295,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              child: Column(children: [
                                SizedBox(
                                  height: 40,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: comparison.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedIndex = index;
                                            });
                                          },
                                          child: GlobalContainer(
                                            height: 30,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            color: const Color.fromARGB(
                                                255, 219, 220, 225),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Text(
                                              comparison[index].subjectName,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 250,
                                  child: SfCartesianChart(
                                    isTransposed: false,
                                    primaryXAxis: CategoryAxis(),
                                    margin: const EdgeInsets.all(20),
                                    primaryYAxis: NumericAxis(
                                      rangePadding: ChartRangePadding.none,
                                      minimum: 0,
                                      maximum: 30,
                                      interval: 10,
                                    ),
                                    tooltipBehavior: _tooltip,
                                    series: <ChartSeries<_ChartData, String>>[
                                      BarSeries<_ChartData, String>(
                                        width: 0.1,
                                        borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(4),
                                            topRight: Radius.circular(4)),
                                        dataSource: data1,
                                        xValueMapper: (_ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (_ChartData data, _) =>
                                            data.y,
                                        name: 'Gold',
                                        color: Colors.blueAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Column(
                      children: [Text('jack')],
                    ),
                    const Column(
                      children: [Text('jack')],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreType extends StatelessWidget {
  final String scoreType;
  final String score;
  const ScoreType({
    Key? key,
    required this.scoreType,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
          text: scoreType,
          textStyle: appStyle(
            fw: FontWeight.w400,
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        ReusableText(
          text: score,
          textStyle: appStyle(
            fw: FontWeight.w400,
            fontSize: 15,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
