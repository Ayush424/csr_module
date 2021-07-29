import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Organization extends StatefulWidget {
  const Organization({Key? key}) : super(key: key);

  @override
  _OrganizationState createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
  final year = DateTime.now().year.toString();
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Organization',
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
            Text(
              'Core Team',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 44, 82, 130),
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
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
                            .collection('core_team')
                            .doc(DateTime.now().year.toString())
                            .collection("members")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.data!.docs.length == 0) {
                            return Center(
                              child: Text(
                                "Core Team for this year not set yet, ask admin to set it.",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 44, 82, 130)),
                              ),
                            );
                          } else {
                            return DataTable(
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Text('Name',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                          fontWeight: FontWeight.bold)),
                                ),
                                DataColumn(
                                  label: Text('Department',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                snapshot.data!.docs.length,
                                (int index) => DataRow(
                                  color:
                                      MaterialStateProperty.resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
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
                                        snapshot.data!.docs[index]["name"])),
                                    DataCell(Text(snapshot.data!.docs[index]
                                        ["department"])),
                                  ],
                                ),
                              ),
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Volunteers',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 44, 82, 130),
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
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
                            .where('volunteering hours', isGreaterThan: 0)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.data == null)
                            return Center(child: CircularProgressIndicator());
                          else if (snapshot.data!.docs.length == 0) {
                            return Center(
                              child: Text(
                                "No one is eligible",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 44, 82, 130)),
                              ),
                            );
                          } else {
                            return DataTable(
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Text('Name ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                          fontWeight: FontWeight.bold)),
                                ),
                                DataColumn(
                                  label: Text('Department',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                snapshot.data!.docs.length,
                                (int index) => DataRow(
                                  color:
                                      MaterialStateProperty.resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Color.fromARGB(255, 237, 242, 247)
                                          .withOpacity(0.08);
                                    }
                                    if (index.isEven) {
                                      return Color.fromARGB(255, 237, 242, 247);
                                    }
                                    return null;
                                  }),
                                  cells: <DataCell>[
                                    DataCell(Text(snapshot.data!.docs[index]
                                        ['displayName'])),
                                    DataCell(Text(snapshot.data!.docs[index]
                                        ['department'])),
                                  ],
                                ),
                              ),
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
