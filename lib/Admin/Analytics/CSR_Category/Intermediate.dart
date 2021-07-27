import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Intermediate extends StatefulWidget {
  Intermediate({Key? key}) : super(key: key);

  @override
  _IntermediateState createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> {
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
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
                stream: FirebaseFirestore.instance
                    .collection('Users')
                    .where('volunteering hours', isEqualTo: 1)
                    .where('volunteering hours', isLessThan: 2)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.data!.docs.length == 0) {
                    return SizedBox(
                      height: 50,
                      child: Center(
                          child: Text(
                              'No Employee is added in this category yet.',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 42, 67, 101),
                                  fontWeight: FontWeight.bold))),
                    );
                  } else {
                    return DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text('Emp',
                              style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        DataColumn(
                          label: Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                            child: Text('Name',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        DataColumn(
                          label: Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                            child: Text('Department',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
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
                            DataCell(
                                Text(snapshot.data!.docs[index]['empcode'])),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Text(
                                    snapshot.data!.docs[index]['displayName']),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Text(
                                    snapshot.data!.docs[index]['department']),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
