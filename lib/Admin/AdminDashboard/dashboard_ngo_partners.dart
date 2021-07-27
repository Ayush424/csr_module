import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class NgoPartners extends StatefulWidget {
  const NgoPartners({Key? key}) : super(key: key);

  @override
  State<NgoPartners> createState() => _NgoPartnersState();
}

class _NgoPartnersState extends State<NgoPartners> {
  static const int numItems2 = 10;
  List<bool> selected = List<bool>.generate(numItems2, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 14),
      height: 400,
      decoration: BoxDecoration(
          border: Border.all(
        color: Color.fromARGB(255, 204, 204, 204),
        width: 1,
      )),
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: ScrollController(),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('ngos').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.docs.length == 0) {
                  return SizedBox(
                    height: 50,
                    child: Center(
                        child: Text('No NGO is added yet.',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 42, 67, 101),
                                fontWeight: FontWeight.bold))),
                  );
                } else {
                  return DataTable(
                    columnSpacing: 180,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('NGO Name',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('Category',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('MOU Start Date',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('MOU End Date',
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
                          return Color.fromARGB(255, 237, 242, 247);
                        }),
                        cells: <DataCell>[
                          DataCell(Text(
                            snapshot.data!.docs[index]['name'],
                            style: TextStyle(fontSize: 20),
                          )),
                          DataCell(Text(
                            snapshot.data!.docs[index]['category'],
                          )),
                          DataCell(
                            Text(
                              snapshot.data!.docs[index]["MouStartDate"]
                                      .toDate()
                                      .day
                                      .toString() +
                                  '-' +
                                  snapshot.data!.docs[index]["MouStartDate"]
                                      .toDate()
                                      .month
                                      .toString() +
                                  '-' +
                                  snapshot.data!.docs[index]["MouStartDate"]
                                      .toDate()
                                      .year
                                      .toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              snapshot.data!.docs[index]["MouEndDate"]
                                      .toDate()
                                      .day
                                      .toString() +
                                  '-' +
                                  snapshot.data!.docs[index]["MouEndDate"]
                                      .toDate()
                                      .month
                                      .toString() +
                                  '-' +
                                  snapshot.data!.docs[index]["MouEndDate"]
                                      .toDate()
                                      .year
                                      .toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}

