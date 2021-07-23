import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  @override
  Widget build(BuildContext context) {
    //  var screenSize = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('activities')
            .doc('rKjP6IlqYq6wtWzy9DeO')
            .collection('companyInitiatedActivities')
            .snapshots(),
        builder: (context, snapshot1) {
          return StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('activities')
                  .doc('rKjP6IlqYq6wtWzy9DeO')
                  .collection('governmentInitiatedActivities')
                  .snapshots(),
              builder: (context, snapshot2) {
                return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('activities')
                        .doc('rKjP6IlqYq6wtWzy9DeO')
                        .collection('permittedActivities')
                        .snapshots(),
                    builder: (context, snapshot3) {
                      return Container(
                        color: Colors.white,
                        constraints: BoxConstraints.expand(),
                        child: Padding(
                          padding: EdgeInsets.all(40),
                          child: SingleChildScrollView(
                            controller: ScrollController(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Activity',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 42, 67, 101),
                                      fontSize: 36,
                                      decoration: TextDecoration.none),
                                ),
                                Divider(
                                  color: Color.fromARGB(255, 226, 232, 240),
                                  thickness: 2,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Permitted Activties',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromARGB(255, 44, 82, 130),
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Color.fromARGB(255, 204, 204, 204),
                                    width: 1,
                                  )),
                                  child: snapshot3.hasData
                                      ? SingleChildScrollView(
                                          controller: ScrollController(),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              DataTable(
                                                columns: const <DataColumn>[
                                                  DataColumn(
                                                    label: Text('Name',
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    44,
                                                                    82,
                                                                    130),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  DataColumn(
                                                    label: Text('Description',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255, 44, 82, 130),
                                                        )),
                                                  ),
                                                ],
                                                rows: List<DataRow>.generate(
                                                  snapshot3.data!.docs.length,
                                                  (int index) => DataRow(
                                                    color: MaterialStateProperty
                                                        .resolveWith<Color?>(
                                                            (Set<MaterialState>
                                                                states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .selected)) {
                                                        return Color.fromARGB(
                                                                255,
                                                                237,
                                                                242,
                                                                247)
                                                            .withOpacity(0.08);
                                                      }
                                                      if (index.isEven) {
                                                        return Color.fromARGB(
                                                            255, 237, 242, 247);
                                                      }
                                                      return null;
                                                    }),
                                                    cells: <DataCell>[
                                                      DataCell(Text(snapshot3
                                                              .data!.docs[index]
                                                          ['name'])),
                                                      DataCell(Text(snapshot3
                                                              .data!.docs[index]
                                                          ['description'])),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Center(
                                          child: CircularProgressIndicator()),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Company Initiated Activities',
                                              style: TextStyle(
                                                fontSize: 24,
                                                color: Color.fromARGB(
                                                    255, 44, 82, 130),
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              // width: 650,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 204, 204, 204),
                                                width: 1,
                                              )),
                                              child: snapshot1.hasData
                                                  ? SingleChildScrollView(
                                                      controller:
                                                          ScrollController(),
                                                      child: DataTable(
                                                        columns: const <
                                                            DataColumn>[
                                                          DataColumn(
                                                            label: Text(
                                                                'Name of Activites',
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            44,
                                                                            82,
                                                                            130),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                        ],
                                                        rows: List<
                                                            DataRow>.generate(
                                                          snapshot1.data!.docs
                                                              .length,
                                                          (int index) =>
                                                              DataRow(
                                                            color: MaterialStateProperty
                                                                .resolveWith<
                                                                    Color?>((Set<
                                                                        MaterialState>
                                                                    states) {
                                                              if (states.contains(
                                                                  MaterialState
                                                                      .selected)) {
                                                                return Color
                                                                        .fromARGB(
                                                                            255,
                                                                            237,
                                                                            242,
                                                                            247)
                                                                    .withOpacity(
                                                                        0.08);
                                                              }
                                                              if (index
                                                                  .isEven) {
                                                                return Color
                                                                    .fromARGB(
                                                                        255,
                                                                        237,
                                                                        242,
                                                                        247);
                                                              }
                                                              return null;
                                                            }),
                                                            cells: <DataCell>[
                                                              DataCell(Text(snapshot1
                                                                          .data!
                                                                          .docs[
                                                                      index]
                                                                  ['name'])),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                      ),
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Government Initiated Activities',
                                              style: TextStyle(
                                                fontSize: 24,
                                                color: Color.fromARGB(
                                                    255, 44, 82, 130),
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 200,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 204, 204, 204),
                                                width: 1,
                                              )),
                                              // width: 650,
                                              child: snapshot2.hasData
                                                  ? SingleChildScrollView(
                                                      controller:
                                                          ScrollController(),
                                                      child: DataTable(
                                                        columns: const <
                                                            DataColumn>[
                                                          DataColumn(
                                                            label: Text(
                                                                'Name of Activites',
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            44,
                                                                            82,
                                                                            130),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                        ],
                                                        rows: List<
                                                            DataRow>.generate(
                                                          snapshot2.data!.docs
                                                              .length,
                                                          (int index) =>
                                                              DataRow(
                                                            color: MaterialStateProperty
                                                                .resolveWith<
                                                                    Color?>((Set<
                                                                        MaterialState>
                                                                    states) {
                                                              if (states.contains(
                                                                  MaterialState
                                                                      .selected)) {
                                                                return Color
                                                                        .fromARGB(
                                                                            255,
                                                                            237,
                                                                            242,
                                                                            247)
                                                                    .withOpacity(
                                                                        0.08);
                                                              }
                                                              if (index
                                                                  .isEven) {
                                                                return Color
                                                                    .fromARGB(
                                                                        255,
                                                                        237,
                                                                        242,
                                                                        247);
                                                              }
                                                              return null;
                                                            }),
                                                            cells: <DataCell>[
                                                              DataCell(Text(snapshot2
                                                                          .data!
                                                                          .docs[
                                                                      index]
                                                                  ['name'])),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              });
        });
  }
}
