import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:csr_module/Theme/colors.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class SetGoals extends StatefulWidget {
  const SetGoals({Key? key}) : super(key: key);

  @override
  _SetGoalsState createState() => _SetGoalsState();
}

class _SetGoalsState extends State<SetGoals> {
  final AuthService _authService = AuthService();
  final TextEditingController goalController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  final TextEditingController othersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 130,
            runSpacing: 15,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Goal",
                    style: TextStyle(
                        color: lightblue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: goalController,
                      decoration: InputDecoration(hintText: "Write your goal"),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Set days",
                    style: TextStyle(
                        color: lightblue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: daysController,
                      decoration:
                          InputDecoration(hintText: "Days for completion"),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Others",
                    style: TextStyle(
                        color: lightblue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: othersController,
                      decoration:
                          InputDecoration(hintText: "Extra Information"),
                    ),
                  )
                ],
              ),
              GestureDetector(
                child: Chip(
                  backgroundColor: darkblue,
                  label: const SizedBox(
                    height: 40,
                    width: 60,
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  avatar: const Icon(
                    Icons.add_circle_outline_outlined,
                    color: Colors.white,
                    size: 27,
                  ),
                ),
                onTap: () {
                  final Map<String, dynamic> entry = {
                    'goal': goalController.text,
                    'days': daysController.text,
                    'others': othersController.text,
                    'completed': false,
                    'startDate': Timestamp.now()
                  };

                  if (goalController.text.isNotEmpty &&
                      daysController.text.isNotEmpty &&
                      othersController.text.isNotEmpty) {
                    FirebaseFirestore.instance
                        .collection('goals')
                        .doc(_authService.returnCurrentUserid())
                        .collection('user_goals')
                        .add(entry)
                        .then(
                          (result) => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: const SizedBox(
                                height: 100,
                                child: Center(
                                  child: Text(
                                    'Goal added',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                        );
                  } else {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              content: Text(
                                'Please fill all the fields',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  }
                },
              ),
            ],
          ),
        ),
        const Text(
          "Previous Goals and Accomplishments",
          style: TextStyle(
            fontSize: 33,
            color: Color.fromARGB(255, 42, 67, 101),
          ),
        ),
        const Divider(
          thickness: 3,
          color: Color.fromARGB(255, 237, 242, 247),
        ),
        SizedBox(
          height: 290,
          width: 1200,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 204, 204, 204))),
            child: const GoalsList(),
          ),
        ),
      ],
    );
  }
}

class GoalsList extends StatefulWidget {
  const GoalsList({Key? key}) : super(key: key);

  @override
  _GoalsListState createState() => _GoalsListState();
}

class _GoalsListState extends State<GoalsList> {
  // final AuthService _authService = AuthService();

  static const int numItems = 6;

  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    // final List<GoalsEntry>? goals = Provider.of<List<GoalsEntry>?>(context);
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('goals')
            .doc(authService.returnCurrentUserid())
            .collection('user_goals')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: ScrollController(),
            child: SingleChildScrollView(
              child: DataTable(
                  columnSpacing: 150,
                  columns: <DataColumn>[
                    DataColumn(
                        label: Text(
                      'Name',
                      style: TextStyle(
                          color: lightblue, fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'Start Date',
                      style: TextStyle(
                          color: lightblue, fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'Completion Date',
                      style: TextStyle(
                          color: lightblue, fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'Progress',
                      style: TextStyle(
                          color: lightblue, fontWeight: FontWeight.bold),
                    )),
                  ],
                  rows: List<DataRow>.generate(
                    snapshot.data!.docs.length,
                    (int index) => DataRow(
                        color: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          // All rows will have the same selected color.
                          if (states.contains(MaterialState.selected)) {
                            return Color.fromARGB(255, 237, 242, 247)
                                .withOpacity(0.08);
                          }
                          // Even rows will have a grey color.
                          if (index.isEven) {
                            return Color.fromARGB(255, 237, 242, 247);
                          }
                          return null; // Use default value for other states and odd rows.
                        }),
                        cells: <DataCell>[
                          DataCell(
                            Text(
                              snapshot.data!.docs[index]['goal'],
                              style: TextStyle(
                                  color: darkblue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataCell(
                            Text(
                              "Start Date: " +
                                  snapshot.data!.docs[index]['startDate']
                                      .toDate()
                                      .day
                                      .toString() +
                                  "/" +
                                  snapshot.data!.docs[index]['startDate']
                                      .toDate()
                                      .month
                                      .toString() +
                                  "/" +
                                  snapshot.data!.docs[index]['startDate']
                                      .toDate()
                                      .year
                                      .toString(),
                              style: TextStyle(color: lightblue, fontSize: 15),
                            ),
                          ),
                          DataCell(
                            Text(
                              "Completion date: " +
                                  snapshot.data!.docs[index]['startDate']
                                      .toDate()
                                      .add(Duration(
                                          days: int.parse(snapshot
                                              .data!.docs[index]['days'])))
                                      .day
                                      .toString() +
                                  "/" +
                                  snapshot.data!.docs[index]['startDate']
                                      .toDate()
                                      .add(Duration(
                                          days: int.parse(snapshot
                                              .data!.docs[index]['days'])))
                                      .month
                                      .toString() +
                                  "/" +
                                  snapshot.data!.docs[index]['startDate']
                                      .toDate()
                                      .add(Duration(
                                          days: int.parse(snapshot
                                              .data!.docs[index]['days'])))
                                      .year
                                      .toString(),
                              style: TextStyle(color: lightblue, fontSize: 15),
                            ),
                          ),
                          DataCell(
                            Chip(
                                backgroundColor: snapshot.data!.docs[index]
                                        ['completed']
                                    ? Colors.green
                                    : Colors.pinkAccent,
                                label: snapshot.data!.docs[index]['completed']
                                    ? Text("Completed")
                                    : Text("Ongoing")),
                          ),
                        ]),
                  )),
            ),
          );
        });
  }
}
