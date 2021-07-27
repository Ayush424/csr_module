import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class CsrEvents extends StatefulWidget {
  const CsrEvents({Key? key}) : super(key: key);

  @override
  State<CsrEvents> createState() => _CsrEventsState();
}

class _CsrEventsState extends State<CsrEvents> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      height: 400,
      decoration: BoxDecoration(
          border: Border.all(
        color: Color.fromARGB(255, 204, 204, 204),
        width: 1,
      )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('events').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.data!.docs.length == 0) {
                    return SizedBox(
                      height: 50,
                      child: Center(
                          child: Text('No Event is scheduled for now.',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 42, 67, 101),
                                  fontWeight: FontWeight.bold))),
                    );
                  } else {
                    return DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text('Event Name',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                  fontWeight: FontWeight.bold)),
                        ),
                        DataColumn(
                          label: Text('Start Date',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                  fontWeight: FontWeight.bold)),
                        ),
                        DataColumn(
                          label: Text('End Date',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        snapshot.data!.docs.length,
                        (int index) => DataRow(
                          color: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Color.fromARGB(255, 237, 242, 247)
                                  .withOpacity(0.08);
                            }
                            if (index.isEven) {
                              return Color.fromARGB(255, 237, 242, 247);
                            }
                            return null;
                          }),
                          cells: <DataCell>[
                            DataCell(Text(
                              snapshot.data!.docs[index]['name'],
                              style: TextStyle(fontSize: 20),
                            )),
                            DataCell(
                              Text(
                                snapshot.data!.docs[index]["startdate"]
                                        .toDate()
                                        .day
                                        .toString() +
                                    '-' +
                                    snapshot.data!.docs[index]["startdate"]
                                        .toDate()
                                        .month
                                        .toString() +
                                    '-' +
                                    snapshot.data!.docs[index]["startdate"]
                                        .toDate()
                                        .year
                                        .toString(),
                              ),
                            ),
                            DataCell(
                              Text(
                                snapshot.data!.docs[index]["endDate"]
                                        .toDate()
                                        .day
                                        .toString() +
                                    '-' +
                                    snapshot.data!.docs[index]["endDate"]
                                        .toDate()
                                        .month
                                        .toString() +
                                    '-' +
                                    snapshot.data!.docs[index]["endDate"]
                                        .toDate()
                                        .year
                                        .toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //  sortColumnIndex: count_newbie = snapshot.data!.docs.length,
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
