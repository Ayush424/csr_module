import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeTrainings extends StatefulWidget {
  const HomeTrainings({Key? key}) : super(key: key);

  @override
  _HomeTrainingsState createState() => _HomeTrainingsState();
}

class _HomeTrainingsState extends State<HomeTrainings> {
  Duration duration = Duration(days: 0);
  final AuthService _authService = AuthService();
  final f = DateFormat('dd-MM-yyyy');
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Trainings',
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
                          .collection('trainings')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null)
                          return Center(child: CircularProgressIndicator());
                        return DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text('Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 44, 82, 130))),
                            ),
                            DataColumn(
                              label: Text('Duration',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 44, 82, 130),
                                  )),
                            ),
                            DataColumn(
                              label: Text('Starting On',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 44, 82, 130),
                                  )),
                            ),
                            DataColumn(
                              label: Padding(
                                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                child: Text('Action',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 44, 82, 130),
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
                                    Text(snapshot.data!.docs[index]['name'])),
                                DataCell(Text(snapshot
                                        .data!.docs[index]['duration']
                                        .toString() +
                                    ' hours')),
                                DataCell(Text(snapshot
                                        .data!.docs[index]['startDate']
                                        .toDate()
                                        .day
                                        .toString() +
                                    '-' +
                                    snapshot.data!.docs[index]['startDate']
                                        .toDate()
                                        .month
                                        .toString() +
                                    '-' +
                                    snapshot.data!.docs[index]['startDate']
                                        .toDate()
                                        .year
                                        .toString())),
                                DataCell(
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                    child: ElevatedButton.icon(
                                      icon: Icon(
                                        Icons.read_more,
                                        size: 24.0,
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color.fromRGBO(
                                                    45, 55, 72, 1)),
                                      ),
                                      label: Text('Apply'),
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('Users')
                                            .doc(_authService
                                                .returnCurrentUserid())
                                            .collection('trainings')
                                            .doc(snapshot.data!.docs[index]
                                                ['id'])
                                            .set({
                                          'name': snapshot.data!.docs[index]
                                              ['name'],
                                          'duration': snapshot.data!.docs[index]
                                              ['duration'],
                                          'startDate': snapshot
                                              .data!.docs[index]['startDate']
                                        }).then(
                                          (result) => showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              content: SizedBox(
                                                height: 150,
                                                child: Center(
                                                  child: Text(
                                                    'Applied Successfully',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Registered & Completed',
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
                          .doc(_authService.returnCurrentUserid())
                          .collection('trainings')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null)
                          return Center(child: CircularProgressIndicator());

                        return DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text('Name ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 44, 82, 130))),
                            ),
                            DataColumn(
                              label: Text('Duration',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 44, 82, 130),
                                  )),
                            ),
                            DataColumn(
                              label: Text('Starting On',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 44, 82, 130),
                                  )),
                            ),
                            DataColumn(
                              label: Text('Status',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 44, 82, 130),
                                  )),
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
                                    Text(snapshot.data!.docs[index]['name'])),
                                DataCell(Text(snapshot
                                        .data!.docs[index]['duration']
                                        .toString() +
                                    ' hours')),
                                DataCell(Text(snapshot
                                        .data!.docs[index]['startDate']
                                        .toDate()
                                        .day
                                        .toString() +
                                    '-' +
                                    snapshot.data!.docs[index]['startDate']
                                        .toDate()
                                        .month
                                        .toString() +
                                    '-' +
                                    snapshot.data!.docs[index]['startDate']
                                        .toDate()
                                        .year
                                        .toString())),
                                DataCell(DateTime.now().difference(snapshot
                                            .data!.docs[index]['startDate']
                                            .toDate()) >=
                                        duration
                                    ? Text("Completed",
                                        style: TextStyle(color: Colors.green))
                                    : Text(
                                        "Registered",
                                        style: TextStyle(color: Colors.orange),
                                      )),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
