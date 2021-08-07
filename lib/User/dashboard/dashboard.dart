import 'dart:async';
import 'dart:ui';
// import 'package:marquee/marquee.dart';

import 'package:csr_module/Theme/colors.dart';
// import 'package:csr_module/auth/services/firestore_service.dart';
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
  final AuthService _authService = AuthService();
  late final int counter;
  static const int numItems = 10;
  static const int numitems = 10;
  late ScrollController scrollController;
  List<String> _marqueeList = List<String>.generate(numitems, (i) => '');

  late Timer _timer;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  late List<Days> _chartData;
  late TooltipBehavior _tooltipBehavior;

  late DateTime date;

  DateFormat format = DateFormat('MMM, y');

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);

    date = DateTime.now();
    scrollController = new ScrollController();
    animate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var size = MediaQuery.of(context).size;

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
                            ColumnSeries<Days, String>(
                              width: 0.5,
                              spacing: 0.3,
                              enableTooltip: true,
                              dataSource: _chartData,
                              xValueMapper: (Days day, _) => day.month,
                              yValueMapper: (Days day, _) =>
                                  day.volunteeringHours,
                            )
                          ],
                          primaryXAxis: CategoryAxis()),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 10),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250,
                      margin: EdgeInsets.only(left: 56, right: 18),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(237, 242, 247, 1),
                          border: Border.all(
                              color: Color.fromRGBO(204, 204, 204, 1))),
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        children: [
                          Flexible(
                            child: Text(
                              'News and Events',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 42, 67, 101)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("news")
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.data == null) {
                                  return CircularProgressIndicator();
                                }

                                return Flexible(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      controller: scrollController,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          subtitle: Text(snapshot
                                                  .data!.docs[index]["date"]
                                                  .toDate()
                                                  .day
                                                  .toString() +
                                              "/" +
                                              snapshot.data!.docs[index]["date"]
                                                  .toDate()
                                                  .month
                                                  .toString() +
                                              "/" +
                                              snapshot.data!.docs[index]["date"]
                                                  .toDate()
                                                  .year
                                                  .toString()),
                                          leading: Icon(Icons.arrow_right),
                                          title: Text(
                                            snapshot.data!.docs[index]["News"],
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        );
                                      }),
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
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
          Container(
            height: 400,
            decoration: BoxDecoration(
                border: Border.all(
              color: Color.fromARGB(255, 204, 204, 204),
              width: 1,
            )),
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('events')
                        .where('team',
                            arrayContains: _authService.returnCurrentUserid())
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Text(
                              "You have not registered/participated in any events till now.",
                              style: TextStyle(
                                  color: lightblue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        );
                      } else {
                        return DataTable(
                          columnSpacing: 120,
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text('Event Name',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 44, 82, 130),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                            DataColumn(
                              label: Text('Duration',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 44, 82, 130),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                            DataColumn(
                              label: Text(' ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 44, 82, 130),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                            DataColumn(
                              label: Text('',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 44, 82, 130),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                            DataColumn(
                              label: Text('',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 44, 82, 130),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                          ],
                          rows: List<DataRow>.generate(
                            snapshot.data!.docs.length,
                            (int counter) => DataRow(
                              color: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Color.fromARGB(255, 237, 242, 247)
                                      .withOpacity(0.08);
                                }
                                if (counter.isEven) {
                                  return Color.fromARGB(255, 237, 242, 247);
                                }
                                return null;
                              }),
                              cells: <DataCell>[
                                DataCell(
                                  Center(
                                    child: Text(
                                        snapshot.data!.docs[counter]['name'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromRGBO(
                                                42, 67, 101, 1))),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text('5 hours',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                42, 67, 101, 1))),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(
                                        'updated ' +
                                            DateTime.now()
                                                .difference(snapshot.data!
                                                    .docs[counter]['startdate']
                                                    .toDate())
                                                .inDays
                                                .toString() +
                                            ' days ago',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                42, 67, 101, 1))),
                                  ),
                                ),
                                DataCell(
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromRGBO(44, 82, 130, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                    title: Center(
                                                        child: Text(
                                                      'Team Members',
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            42, 67, 101, 1),
                                                      ),
                                                    )),
                                                    content: Container(
                                                      height: size.height * 0.3,
                                                      width: size.width * 0.3,
                                                      child: ListView.builder(
                                                          controller:
                                                              ScrollController(),
                                                          physics:
                                                              ClampingScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemCount: snapshot
                                                              .data!
                                                              .docs[counter]
                                                                  ['team']
                                                              .length,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            final docId = snapshot
                                                                    .data!
                                                                    .docs[counter]
                                                                ['team'][index];

                                                            return StreamBuilder<
                                                                    DocumentSnapshot>(
                                                                stream: FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'Users')
                                                                    .doc(docId)
                                                                    .snapshots(),
                                                                builder: (context,
                                                                    snapshot2) {
                                                                  if (snapshot2
                                                                          .data ==
                                                                      null) {
                                                                    return Center(
                                                                        child:
                                                                            CircularProgressIndicator());
                                                                  }

                                                                  return ListTile(
                                                                    tileColor:
                                                                        Colors.grey[
                                                                            200],
                                                                    horizontalTitleGap:
                                                                        25,
                                                                    leading:
                                                                        SizedBox(
                                                                      width:
                                                                          120,
                                                                      child:
                                                                          Text(
                                                                        snapshot2
                                                                            .data!['displayName'],
                                                                        maxLines:
                                                                            2,
                                                                      ),
                                                                    ),
                                                                    title: Transform(
                                                                        transform: Matrix4.translationValues(
                                                                            20,
                                                                            0,
                                                                            0),
                                                                        child: Text(
                                                                            snapshot2.data!['empcode'])),
                                                                    trailing: Text(
                                                                        snapshot2
                                                                            .data!['department']),
                                                                  );
                                                                });
                                                          }),
                                                    )));
                                      },
                                      child: Text(
                                        'Team Members',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 252, 254, 1)),
                                      )),
                                ),
                                DataCell(
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.pink,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )),
                                      onPressed: () {},
                                      child: Text(
                                        'Ongoing',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1)),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void animate() async {
    if (scrollController.positions.isNotEmpty) {
      while (true) {
        await scrollController.animateTo(0.0,
            duration: new Duration(milliseconds: 400), curve: Curves.ease);
        await scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: new Duration(seconds: 8),
            curve: Curves.linear);
      }
    } else {
      _timer = new Timer(const Duration(milliseconds: 400), () {
        animate();
      });
    }
  }
}

List<Days> getChartData() {
  final List<Days> chartData = [
    Days('1', 7),
    Days('7', 7),
    Days('14', 10),
    Days('21', 5),
    Days('28', 6),
  ];
  return chartData;
}

class Days {
  final String month;
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
                          else
                            index = index - 1;

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
