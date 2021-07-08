import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  final AuthService authService = AuthService();
  late List<Days> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('goals')
          .doc(authService.returnCurrentUserid())
          .collection('user_goals')
          .where("completed", isEqualTo: false)
          .snapshots(),
      builder: (context, snapshot) {
        return Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: ListView(
            controller: ScrollController(),
            children: [
              Text(
                'Dashboard',
                style: TextStyle(
                    fontSize: 36, color: Color.fromARGB(255, 42, 67, 101)),
              ),
              Divider(
                thickness: 3,
                color: Color.fromARGB(255, 237, 242, 247),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                          height: screensize.height * 0.60,
                          width: screensize.width * 0.65,
                          child: SfCartesianChart(
                            title: ChartTitle(
                              text: 'Total Volunteering Hours',
                              alignment: ChartAlignment.near,
                            ),
                            tooltipBehavior: _tooltipBehavior,
                            plotAreaBorderColor: Colors.green,
                            series: <ChartSeries>[
                              ColumnSeries<Days, DateTime>(
                                enableTooltip: true,
                                dataSource: _chartData,
                                xValueMapper: (Days day, _) => day.month,
                                yValueMapper: (Days day, _) =>
                                    day.volunteeringHours,
                              )
                            ],
                            primaryXAxis: DateTimeAxis(
                              intervalType: DateTimeIntervalType.months,
                              interval: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      width: screensize.width * 0.2,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(237, 242, 247, 1),
                          border: Border.all(
                              color: Color.fromRGBO(204, 204, 204, 1))),
                      child: snapshot.hasData
                          ? Column(
                              children: [
                                Text(
                                  "Current Goal-",
                                  style: TextStyle(
                                      color: Color.fromRGBO(45, 55, 72, 1),
                                      fontFamily: 'Rubik',
                                      fontSize: 24,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  snapshot.data!.docs[0]['goal'],
                                  style: TextStyle(
                                      color: Color.fromRGBO(45, 55, 72, 1),
                                      fontFamily: 'Rubik',
                                      fontSize: 24,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: snapshot.data!.docs[0]['days'],
                                      style: TextStyle(
                                          color: Color.fromRGBO(45, 55, 72, 1),
                                          fontFamily: 'Rubik',
                                          fontSize: 48,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    WidgetSpan(
                                        child: Transform.translate(
                                      offset: const Offset(2, 4),
                                      child: Text(
                                        'Days left',
                                        textScaleFactor: 0.9,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ))
                                  ])),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(snapshot.data!.docs[0]['others']),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // final id = snapshot.data!.docs[0].id;
                                          // FirebaseFirestore.instance
                                          //     .collection('goals')
                                          //     .doc(authService
                                          //         .returnCurrentUserid())
                                          //     .collection('user_goals')
                                          //     .doc(id)
                                          //     .update({'completed': true});
                                        },
                                        child: Text(
                                          'Set as Complete',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromRGBO(44, 82, 130, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Change',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromRGBO(44, 82, 130, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Recent Activities',
                    style: TextStyle(
                        fontSize: 32, color: Color.fromARGB(255, 42, 67, 101)),
                  ),
                ],
              ),
              Divider(
                thickness: 3,
                color: Color.fromARGB(255, 237, 242, 247),
              ),
              ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('xyz',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        Text('updated 3 weeks ago',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Ongoing',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(44, 82, 130, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Team Members',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 252, 254, 1)),
                            )),
                        Text('5 hours',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('xyz',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        Text('updated 3 weeks ago',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(44, 82, 130, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Team Members',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 252, 254, 1)),
                            )),
                        Text('5 hours',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('xyz',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        Text('updated 3 weeks ago',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(44, 82, 130, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Team Members',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 252, 254, 1)),
                            )),
                        Text('5 hours',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('xyz',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        Text('updated 3 weeks ago',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(44, 82, 130, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Team Members',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 252, 254, 1)),
                            )),
                        Text('5 hours',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('xyz',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        Text('updated 3 weeks ago',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(44, 82, 130, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Team Members',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 252, 254, 1)),
                            )),
                        Text('5 hours',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('xyz',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        Text('updated 3 weeks ago',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(44, 82, 130, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Team Members',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 252, 254, 1)),
                            )),
                        Text('5 hours',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('xyz',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        Text('updated 3 weeks ago',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(44, 82, 130, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Team Members',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 252, 254, 1)),
                            )),
                        Text('5 hours',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('xyz',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        Text('updated 3 weeks ago',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(44, 82, 130, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Team Members',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 252, 254, 1)),
                            )),
                        Text('5 hours',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('xyz',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        Text('updated 3 weeks ago',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(44, 82, 130, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Team Members',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 252, 254, 1)),
                            )),
                        Text('5 hours',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('xyz',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        Text('updated 3 weeks ago',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(44, 82, 130, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Team Members',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 252, 254, 1)),
                            )),
                        Text('5 hours',
                            style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1))),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

List<Days> getChartData() {
  final List<Days> chartData = [
    Days(DateTime(1), 7),
    Days(DateTime(2), 10),
    Days(DateTime(3), 5),
    Days(DateTime(4), 6),
    Days(DateTime(5), 7),
    Days(DateTime(6), 7),
    Days(DateTime(7), 10),
    Days(DateTime(8), 11),
    Days(DateTime(9), 6),
    Days(DateTime(10), 7),
    Days(DateTime(11), 7),
    Days(DateTime(12), 10),
    Days(DateTime(13), 5),
    Days(DateTime(14), 6),
    Days(DateTime(15), 7),
    Days(DateTime(16), 7),
    Days(DateTime(17), 10),
    Days(DateTime(18), 5),
    Days(DateTime(19), 6),
    Days(DateTime(20), 7),
  ];
  return chartData;
}

class Days {
  final DateTime month;
  final double volunteeringHours;

  Days(this.month, this.volunteeringHours);
}
