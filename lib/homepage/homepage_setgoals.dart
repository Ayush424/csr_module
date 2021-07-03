import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Theme/colors.dart';
import 'package:csr_module/auth/models/goals_entry.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final goalsCollection = FirebaseFirestore.instance
        .collection('goals')
        .doc(_authService.returnCurrentUserid())
        .collection('user_goals');
    final goalsStream = goalsCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => GoalsEntry.fromMap(doc.data()))
          .toList();
    });
    return StreamProvider<List<GoalsEntry>?>(
      create: (_) => goalsStream,
      initialData: [],
      child: Wrap(
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
                        decoration:
                            InputDecoration(hintText: "Write your goal"),
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
                    final entry = GoalsEntry(
                            goalController.text,
                            daysController.text,
                            othersController.text,
                            false,
                            Timestamp.now())
                        .toMap();
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
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
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
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
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
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 204, 204, 204))),
              child: const GoalsList(),
            ),
          ),
        ],
      ),
    );
  }
}

class GoalsList extends StatefulWidget {
  const GoalsList({Key? key}) : super(key: key);

  @override
  _GoalsListState createState() => _GoalsListState();
}

class _GoalsListState extends State<GoalsList> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    final List<GoalsEntry>? goals = Provider.of<List<GoalsEntry>?>(context);
    return ListView.builder(
        itemCount: goals!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.zero,
            color: (index % 2 == 0) ? Colors.white : teal,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Wrap(
                  spacing: 150,
                  children: [
                    Text(
                      goals[index].goal,
                      style: TextStyle(
                          color: darkblue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Start Date: " +
                          goals[index].startDate.toDate().day.toString() +
                          "/" +
                          goals[index].startDate.toDate().month.toString() +
                          "/" +
                          goals[index].startDate.toDate().year.toString(),
                      style: TextStyle(color: lightblue, fontSize: 15),
                    ),
                    Text(
                      "Completion date: " +
                          goals[index]
                              .startDate
                              .toDate()
                              .add(Duration(days: int.parse(goals[index].days)))
                              .day
                              .toString() +
                          "/" +
                          goals[index]
                              .startDate
                              .toDate()
                              .add(Duration(days: int.parse(goals[index].days)))
                              .month
                              .toString() +
                          "/" +
                          goals[index]
                              .startDate
                              .toDate()
                              .add(Duration(days: int.parse(goals[index].days)))
                              .year
                              .toString(),
                      style: TextStyle(color: lightblue, fontSize: 15),
                    ),
                  ],
                ),
              ),
              trailing: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: goals[index].completed
                          ? MaterialStateProperty.all(Colors.green)
                          : MaterialStateProperty.all(Colors.pinkAccent)),
                  child: goals[index].completed
                      ? Text(
                          "Completed",
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
                          "Ongoing",
                          style: TextStyle(color: Colors.white),
                        )),
              // Chip(
              //     backgroundColor:
              //         goals[index].completed ? Colors.green : Colors.pinkAccent,
              //     label: goals[index].completed
              //         ? Text("Completed")
              //         : Text("Ongoing")),
            ),
          );
        });
  }
}
