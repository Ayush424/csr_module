import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'Ekohum.dart';
import 'Sanakaar.dart';
import 'SD.dart';
import 'Sikh.dart';

class PayrollCollection extends StatefulWidget {
  const PayrollCollection({Key? key}) : super(key: key);

  @override
  _PayrollCollectionState createState() => _PayrollCollectionState();
}

class _PayrollCollectionState extends State<PayrollCollection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const int numItems = 4;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  late List<Days> _chartData;
  late TooltipBehavior _tooltipBehavior;

  late DateTime date;

  DateFormat format = DateFormat('MMM, y');

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _tabController = TabController(length: 4, vsync: this);

    date = DateTime.now();

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myList = List.generate(4, (index) => Sanakaar());
    var screensize = MediaQuery.of(context).size;
    var ssize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: ListView(
          controller: ScrollController(),
          children: [
            ListTile(
              title: Text(
                'Analytics - Payroll Giving Collection',
                style: TextStyle(
                    fontSize: 36, color: Color.fromARGB(255, 42, 67, 101)),
              ),
            ),
            Divider(
              thickness: 3,
              color: Color.fromARGB(255, 237, 242, 247),
            ),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                spacing: 5,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          date = DateTime(date.year, date.month - 1, 15);
                        });
                      },
                      icon: Icon(
                        Icons.arrow_left,
                        size: 30,
                        color: Color.fromARGB(255, 44, 82, 130),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Icon(
                        Icons.event,
                        color: Color.fromARGB(255, 44, 82, 130),
                        size: 23,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(format.format(date),
                        style: TextStyle(
                          fontSize: 23,
                          color: Color.fromARGB(255, 44, 82, 130),
                        )),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          date = DateTime(date.year, date.month + 1, 15);
                        });
                      },
                      icon: Icon(
                        Icons.arrow_right,
                        size: 30,
                        color: Color.fromARGB(255, 44, 82, 130),
                      )),
                  SizedBox(
                    width: 120,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Column(
                    children: [
                      Container(
                        height: screensize.height * 0.60,
                        width: screensize.width * 0.65,
                        child: SfCartesianChart(
                          tooltipBehavior: _tooltipBehavior,
                          plotAreaBorderColor: Colors.green,
                          series: <ChartSeries>[
                            ColumnSeries<Days, String>(
                              pointColorMapper: (Days day, _) =>
                                  day.pointColorMapper,
                              width: 0.8,
                              spacing: 0.3,
                              enableTooltip: true,
                              dataSource: _chartData,
                              xValueMapper: (Days day, _) => day.month,
                              yValueMapper: (Days day, _) =>
                                  day.volunteeringHours,
                            ),
                          ],
                          primaryXAxis: CategoryAxis(),
                          primaryYAxis:
                              NumericAxis(interval: 2500, maximum: 10000),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ListView(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    physics: ClampingScrollPhysics(),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              'Total Amount Collected',
                              style: TextStyle(
                                  color: Color.fromRGBO(42, 67, 101, 1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Text(
                                  '12.8k ',
                                  style: TextStyle(
                                      color: Color.fromRGBO(42, 67, 101, 1),
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Rubik'),
                                ),
                              ),
                              Flexible(
                                  flex: 1,
                                  child: Text(
                                    'INR',
                                    style: TextStyle(
                                        color: Color.fromRGBO(42, 67, 101, 1)),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, top: 2, bottom: 50),
                            child: SizedBox(
                              height: 120,
                              child: ListView.builder(
                                  controller: ScrollController(),
                                  itemCount: numItems,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return EventsList(
                                        numItems: numItems, index: index);
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TabBar(
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.grey,
                        labelColor: Colors.black,
                        indicatorWeight: 0.1,
                        isScrollable: true,
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
                                  border:
                                      Border.all(color: Colors.grey.shade300)),
                              child: Center(child: Text('SD')),
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
                                child: Center(child: Text('Sanakaar')),
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
                                child: Center(child: Text('Ekohum')),
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
                                child: Center(child: Text('Sikh')),
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
              height: 300,
              constraints: BoxConstraints(maxHeight: 600),
              child: TabBarView(
                controller: _tabController, children: myList,
                // <Widget>[
                // List.generate(4, (index) => null

                //  Column(
                //   children: [
                //     Flexible(
                //       child: myList,
                //     ),
                //   ],
                // ),
                // Column(
                //   children: [
                //     Flexible(
                //       child: Sanakaar(),
                //     ),
                //   ],
                // ),
                // Column(
                //   children: [
                //     Flexible(
                //       child: Ekohum(),
                //     ),
                //   ],
                // ),
                // Column(
                //   children: [
                //     Flexible(
                //       child: Sikh(),
                //     ),
                //   ],
                // ),
                // ]
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Days> getChartData() {
  final List<Days> chartData = <Days>[
    Days('SD', 6000, Colors.pink),
    Days('Sanskaar', 9000, Colors.red),
    Days('Ekohum', 3000, Colors.green),
    Days('Sikh', 5500, Color.fromRGBO(31, 58, 104, 1)),
  ];
  return chartData;
}

class Days {
  final String month;
  final double volunteeringHours;
  final Color pointColorMapper;

  Days(this.month, this.volunteeringHours, this.pointColorMapper);
}

List events = ['SD', "Sanskaar", "Ekohum", "Sikh"];
List colors = [
  Colors.pink,
  Colors.red,
  Colors.green,
  Color.fromRGBO(31, 58, 104, 1)
];

class EventsList extends StatelessWidget {
  const EventsList({Key? key, required this.numItems, required this.index})
      : super(key: key);
  final int index;
  final int numItems;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 10),
      child: Container(
        height: 20,
        child: ListView(
          scrollDirection: Axis.horizontal,
          controller: ScrollController(),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Icon(Icons.crop_square_rounded, color: colors[index]),
            SizedBox(
              width: 10,
            ),
            Text(
              events[index],
              style:
                  TextStyle(color: colors[index], fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class TabData {
  String name;

  String data;

  TabData(this.name, this.data);
}
