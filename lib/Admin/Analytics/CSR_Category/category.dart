import 'package:flutter/material.dart';
import 'Intermediate.dart';
import 'package:pie_chart/pie_chart.dart';
import 'Newbie.dart';

import 'Mature.dart';
import 'Expert.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late DateTime date;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);

    date = DateTime.now();

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Map<String, double> dataMap = {
    "Newbie": 45,
    "Expert": 50,
    "Intermediate": 50,
    "Mature": 100,
  };

  @override
  Widget build(BuildContext context) {
    var ssize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Analytics - CSR Categories',
                  style: TextStyle(
                    fontSize: 36,
                    color: Color.fromARGB(255, 42, 67, 101),
                    decoration: TextDecoration.none,
                  ),
                ),
                Divider(
                  color: Color.fromARGB(255, 226, 232, 240),
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Wrap(
                    children: [
                      PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing:
                            MediaQuery.of(context).size.width >= 990 ? 100 : 50,
                        // chartRadius: MediaQuery.of(context).size.width / 6,
                        // colorList: colorList,
                        chartRadius: 180,
                        initialAngleInDegree: 0,
                        // ringStrokeWidth: 10,
                        // centerText: "HYBRID",
                        legendOptions: LegendOptions(
                          showLegendsInRow: false,
                          legendPosition:
                              MediaQuery.of(context).size.width >= 990
                                  ? LegendPosition.right
                                  : LegendPosition.bottom,
                          showLegends: true,
                          legendTextStyle: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            color: Color.fromARGB(255, 42, 67, 101),
                          ),
                        ),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: false,
                          showChartValuesInPercentage: false,
                          showChartValuesOutside: false,
                          decimalPlaces: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Container(
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: TabBar(
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorWeight: 0.1,
                            isScrollable: true,
                            labelColor: Color.fromRGBO(44, 82, 130, 1),
                            labelStyle: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w400),
                            unselectedLabelStyle: TextStyle(
                                color: Color.fromRGBO(44, 82, 130, 1),
                                fontSize: 28,
                                fontWeight: FontWeight.w400),
                            tabs: [
                              Tab(
                                child: Container(
                                  height: 50,
                                  width: ssize.width * 0.15,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(235, 248, 255, 1),
                                      border: Border.all(
                                          color: Colors.grey.shade300)),
                                  child: Center(child: Text('Newbie')),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(-30, 0, 0),
                                child: Tab(
                                  child: Container(
                                    height: 50,
                                    width: ssize.width * 0.15,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(235, 248, 255, 1),
                                        border: Border.all(
                                            color: Colors.grey.shade300)),
                                    child: Center(child: Text('Intermediate')),
                                  ),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(-60, 0, 0),
                                child: Tab(
                                  child: Container(
                                    height: 50,
                                    width: ssize.width * 0.15,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(235, 248, 255, 1),
                                        border: Border.all(
                                            color: Colors.grey.shade300)),
                                    child: Center(child: Text('Mature')),
                                  ),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(-90, 0, 0),
                                child: Tab(
                                  child: Container(
                                    height: 50,
                                    width: ssize.width * 0.15,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(235, 248, 255, 1),
                                        border: Border.all(
                                            color: Colors.grey.shade300)),
                                    child: Center(child: Text('Expert')),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxHeight: 600),
                  child:
                      TabBarView(controller: _tabController, children: <Widget>[
                    Column(
                      children: [
                        Flexible(
                          child: Newbie(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Flexible(
                          child: Intermediate(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Flexible(
                          child: Mature(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Flexible(
                          child: Expert(),
                        ),
                      ],
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ChartData {
//         ChartData(this.x, this.y, [ this.color]);
//         final String x;
//         final double y;
//         final Color color;
//     }
class MyText extends StatefulWidget {
  final String text;
  const MyText({Key? key, required this.text}) : super(key: key);

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        fontFamily: 'Rubik',
        color: const Color.fromRGBO(44, 82, 130, 1),
      ),
    );
  }
}
