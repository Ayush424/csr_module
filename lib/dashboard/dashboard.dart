import 'dart:ui';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';
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
  static const int numItems = 10;
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
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(237, 242, 247, 1),
                      border:
                          Border.all(color: Color.fromRGBO(204, 204, 204, 1))),
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    controller: ScrollController(),
                    children: [
                      Text(
                        'News and Events',
                        style: TextStyle(
                            fontSize: 24,
                            fontStyle: FontStyle.italic,
                            color: Color.fromARGB(255, 42, 67, 101)),
                      ),
                      // Marquee(
                      //   text: 'Plantation Drive on 21st july,2021'
                      //       'consectetur adipiscing elit'
                      //       ' Facilisis nam arcu tristique'
                      //       ' Volutpat at sit laoreet ornare'
                      //       ' Suspendisse dictum nibh vitae fusce'
                      //       ' netus Ut ut sit at in lobortis leo.',
                      //   scrollAxis: Axis.vertical,
                      //   blankSpace: 20,
                      //   velocity: 20,
                      // ),
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
                    return ListView.builder(
                        controller: ScrollController(),
                        itemCount: snapshot.data!.docs.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ItemCard(snapshot: snapshot, counter: index);
                        });
                  }
                }),
          ),
        ],
      ),
    );
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

const int numMember = 5;
List<bool> selected = List<bool>.generate(numMember, (int index) => false);

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.counter,
    required this.snapshot,
  }) : super(key: key);

  final int counter;
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              child: Text(snapshot.data!.docs[counter]['name'],
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                  'updated ' +
                      DateTime.now()
                          .difference(snapshot.data!.docs[counter]['startdate']
                              .toDate())
                          .inDays
                          .toString() +
                      ' days ago',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
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
                        builder: (BuildContext context) => AlertDialog(
                            title: Center(
                                child: Text(
                              'Team Members',
                              style: TextStyle(
                                color: Color.fromRGBO(42, 67, 101, 1),
                              ),
                            )),
                            content: Container(
                              height: size.height * 0.3,
                              width: size.width * 0.3,
                              child: ListView.builder(
                                  controller: ScrollController(),
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot
                                      .data!.docs[counter]['team'].length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final docId = snapshot.data!.docs[counter]
                                        ['team'][index];

                                    return StreamBuilder<DocumentSnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('Users')
                                            .doc(docId)
                                            .snapshots(),
                                        builder: (context, snapshot2) {
                                          if (snapshot2.data == null) {
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                          return ListTile(
                                            tileColor: Colors.grey[200],
                                            horizontalTitleGap: 25,
                                            leading: SizedBox(
                                              width: 120,
                                              child: Text(
                                                snapshot2.data!['displayName'],
                                                maxLines: 2,
                                              ),
                                            ),
                                            title: Transform(
                                                transform:
                                                    Matrix4.translationValues(
                                                        20, 0, 0),
                                                child: Text(snapshot2
                                                    .data!['empcode'])),
                                            trailing: Text(
                                                snapshot2.data!['department']),
                                          );
                                        });
                                  }),
                            )));
                  },
                  child: Text(
                    'Team Members',
                    style: TextStyle(color: Color.fromRGBO(255, 252, 254, 1)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class Days {
  final String month;
  final double volunteeringHours;

  Days(this.month, this.volunteeringHours);
}
