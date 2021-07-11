import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeDashboard extends StatefulWidget {
  final ValueChanged<String>? update;
  const HomeDashboard({Key? key, this.update}) : super(key: key);

  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
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

    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: ListView(
        controller: ScrollController(),
        children: [
          ListTile(
            title: Text(
              'Dashboard',
              style: TextStyle(
                  fontSize: 36, color: Color.fromARGB(255, 42, 67, 101)),
            ),
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
                              width: 0.5,
                              spacing: 0.3,
                              enableTooltip: true,
                              dataSource: _chartData,
                              xValueMapper: (Days day, _) => day.month,
                              yValueMapper: (Days day, _) =>
                                  day.volunteeringHours,
                            )
                          ],
                          primaryXAxis: DateTimeCategoryAxis(
                              intervalType: DateTimeIntervalType.days,
                              isVisible: true,
                              interval: 7,
                              dateFormat: DateFormat.MMMd())),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  width: screensize.width * 0.2,
                  margin: EdgeInsets.only(left: 20),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    controller: ScrollController(),
                    children: [
                      ListTile(
                        title: Text(
                          'Goals',
                          style: TextStyle(
                              fontSize: 32,
                              color: Color.fromARGB(255, 42, 67, 101)),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                        width: screensize.width * 0.2,
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(237, 242, 247, 1),
                            border: Border.all(
                                color: Color.fromRGBO(204, 204, 204, 1))),
                        child: GoalSection(
                          update: widget.update,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              'Recent Activities',
              style: TextStyle(
                  fontSize: 32, color: Color.fromARGB(255, 42, 67, 101)),
            ),
          ),
          Divider(
            thickness: 3,
            color: Color.fromARGB(255, 237, 242, 247),
          ),
          SizedBox(
            height: 210,
            child: ListView.builder(
                controller: ScrollController(),
                itemCount: numItems,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ItemCard(numItems: 6);
                }),
          ),
        ],
      ),
    );
  }
}

List<Days> getChartData() {
  final List<Days> chartData = [
    Days(DateTime(2021, 1, 7), 7),
    Days(DateTime(2022, 1, 14), 10),
    Days(DateTime(2021, 15, 7), 5),
    Days(DateTime(2021, 22, 7), 6),
    Days(DateTime(2021, 29, 7), 7),
  ];
  return chartData;
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.numItems,
  }) : super(key: key);
  final int numItems;
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return SizedBox(
      height: 35,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text('xyz',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text('updated 3 weeks ago',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Ongoing',
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(44, 82, 130, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              content: Container(
                                height: screensize.height * 0.5,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      DataTable(
                                        columns: const <DataColumn>[
                                          DataColumn(
                                            label: Text('Name',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                )),
                                          ),
                                          DataColumn(
                                            label: Text('Id',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                )),
                                          ),
                                          DataColumn(
                                            label: Text('Profession',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                )),
                                          )
                                        ],
                                        rows: List<DataRow>.generate(
                                          numItems,
                                          (int index) => DataRow(
                                            color: MaterialStateProperty
                                                .resolveWith<Color?>(
                                                    (Set<MaterialState>
                                                        states) {
                                              if (states.contains(
                                                  MaterialState.selected)) {
                                                return Color.fromARGB(
                                                        255, 237, 242, 247)
                                                    .withOpacity(0.08);
                                              }
                                              if (index.isEven) {
                                                return Color.fromARGB(
                                                    255, 237, 242, 247);
                                              }
                                              return null;
                                            }),
                                            cells: <DataCell>[
                                              DataCell(Text('Employee Name')),
                                              DataCell(Text('Employee Id')),
                                              DataCell(Text('Profession'))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  },
                  child: Text(
                    'Team Members',
                    style: TextStyle(color: Color.fromRGBO(255, 252, 254, 1)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text('5 hours',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ),
          ],
        ),
      ),
    );
  }
}

class Days {
  final DateTime month;
  final double volunteeringHours;

  Days(this.month, this.volunteeringHours);
}

class GoalSection extends StatefulWidget {
  final ValueChanged<String>? update;
  const GoalSection({Key? key, this.update}) : super(key: key);

  @override
  _GoalSectionState createState() => _GoalSectionState();
}

class _GoalSectionState extends State<GoalSection> {
  int index = 0;
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('goals')
            .doc(_authService.returnCurrentUserid())
            .collection('user_goals')
            .where("completed", isEqualTo: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null)
            return Center(child: CircularProgressIndicator());
          else if (snapshot.data!.docs.length > 0) {
            return Column(
              children: [
                // Text(
                //   'Current GOAL -',
                //   style: TextStyle(
                //       color: Color.fromRGBO(45, 55, 72, 1),
                //       fontFamily: 'Rubik',
                //       fontSize: 24,
                //       fontStyle: FontStyle.italic,
                //       fontWeight: FontWeight.w700),
                // ),
                Text(
                  snapshot.data!.docs[index]['goal'],
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
                      text: snapshot.data!.docs[index]['days'],
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
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(snapshot.data!.docs[index]['others']),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          final id = snapshot.data!.docs[index].id;
                          if (index == snapshot.data!.docs.length)
                            index = 0;
                          else {
                            if (index != 0) {
                              index = index - 1;
                            }
                          }
                          FirebaseFirestore.instance
                              .collection('goals')
                              .doc(_authService.returnCurrentUserid())
                              .collection('user_goals')
                              .doc(id)
                              .update({'completed': true});
                        },
                        child: Text(
                          'Set as Complete',
                          style: TextStyle(fontSize: 10),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(44, 82, 130, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (index == snapshot.data!.docs.length - 1)
                              index = 0;
                            else
                              index = index + 1;
                          });
                        },
                        child: Text(
                          'Change',
                          style: TextStyle(fontSize: 10),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(44, 82, 130, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'No goals set!',
                    style: TextStyle(
                        color: Color.fromRGBO(45, 55, 72, 1),
                        fontFamily: 'Rubik',
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () => widget.update!('myhome'),
                    // {
                    //   widget.
                    //   // setState(() {
                    //   //   GlobalValues.mainpage = 'myhome';
                    //   // });
                    // },
                    child: Text(
                      'Set goals now',
                      style: TextStyle(fontSize: 10),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(44, 82, 130, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }
}
