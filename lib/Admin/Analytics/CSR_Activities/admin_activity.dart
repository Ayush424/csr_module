import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ActivityAdmin extends StatefulWidget {
  const ActivityAdmin({Key? key}) : super(key: key);

  @override
  _ActivityAdminState createState() => _ActivityAdminState();
}

class _ActivityAdminState extends State<ActivityAdmin> {
  static const int numItems = 20;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  final TextEditingController _nameController = TextEditingController();
  static final List<String> items = <String>[
    'Select type',
    'Government initiated',
    'Company initiated'
  ];
  String value = items.first;

  Future<void> _showMyDialog(String id, String type) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Do you want to delete the file?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("activities")
                    .doc("rKjP6IlqYq6wtWzy9DeO")
                    .collection(type)
                    .doc(id)
                    .delete();

                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
              'Analytics - CSR Activities',
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
            Container(
              height: 100,
              child: Wrap(
                spacing: 100,
                runSpacing: 90,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Types of activity",
                          style: TextStyle(
                            color: Color.fromRGBO(45, 55, 72, 1),
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey.shade600,
                                )),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value,
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          value: item,
                                        ))
                                    .toList(),
                                onChanged: (value) => setState(() {
                                  this.value = value!;
                                }),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name of Activity",
                          style: TextStyle(
                            color: Color.fromRGBO(45, 55, 72, 1),
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 40,
                            child: TextFormField(
                              controller: _nameController,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter Name",
                                border: OutlineInputBorder(),
                                // contentPadding: EdgeInsets.all(10)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   child: Column(
                  //     children: [
                  //       Text(
                  //         "Activity type",
                  //         style: TextStyle(
                  //           color: Color.fromRGBO(45, 55, 72, 1),
                  //           decoration: TextDecoration.none,
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 10),
                  //         child: Container(
                  //           width: 200,
                  //           height: 40,
                  //           decoration: BoxDecoration(
                  //               color: Colors.white,
                  //               border: Border.all(
                  //                 color: Colors.grey.shade400,
                  //               )),
                  //           child: DropdownButtonHideUnderline(
                  //             child: DropdownButton<String>(
                  //               value: value1,
                  //               items: items1
                  //                   .map((item1) => DropdownMenuItem<String>(
                  //                         child: Text(
                  //                           item1,
                  //                           style: TextStyle(
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 15,
                  //                           ),
                  //                         ),
                  //                         value: item1,
                  //                       ))
                  //                   .toList(),
                  //               onChanged: (value1) => setState(() {
                  //                 this.value1 = value1!;
                  //               }),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.add,
                        size: 24.0,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(45, 55, 72, 1)),
                      ),
                      label: Text('Add'),
                      onPressed: () {
                        if (value != items.first &&
                            _nameController.text.isNotEmpty) {
                          if (value == 'Government initiated') {
                            FirebaseFirestore.instance
                                .collection("activities")
                                .doc("rKjP6IlqYq6wtWzy9DeO")
                                .collection("governmentInitiatedActivities")
                                .add({"name": _nameController.text}).then(
                              (result) => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: SizedBox(
                                    height: 150,
                                    child: Center(
                                      child: Text(
                                        'Added Successfully',
                                        style: TextStyle(fontSize: 20),
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
                            FirebaseFirestore.instance
                                .collection("activities")
                                .doc("rKjP6IlqYq6wtWzy9DeO")
                                .collection("companyInitiatedActivities")
                                .add({"name": _nameController.text}).then(
                              (result) => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: SizedBox(
                                    height: 150,
                                    child: Center(
                                      child: Text(
                                        'Added Successfully',
                                        style: TextStyle(fontSize: 20),
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
                          }
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Wrap(
                  spacing: 90,
                  runSpacing: 90,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Company initiated Activities',
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
                          height: 800,
                          width: 500,
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Color.fromARGB(255, 204, 204, 204),
                            width: 1,
                          )),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  child: StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('activities')
                                          .doc('rKjP6IlqYq6wtWzy9DeO')
                                          .collection(
                                              "companyInitiatedActivities")
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.data == null) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if (snapshot.data!.docs.length ==
                                            0) {
                                          return Text("no activities set yet");
                                        } else {
                                          return DataTable(
                                            columns: const <DataColumn>[
                                              DataColumn(
                                                label: Text('Name',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 44, 82, 130),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                              DataColumn(
                                                label: Text('Action',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 44, 82, 130),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                            ],
                                            rows: List<DataRow>.generate(
                                              snapshot.data!.docs.length,
                                              (int index) => DataRow(
                                                color: MaterialStateProperty
                                                    .resolveWith<Color?>(
                                                        (Set<MaterialState>
                                                            states) {
                                                  if (states.contains(
                                                      MaterialState.selected)) {
                                                    return Color.fromARGB(
                                                            255, 237, 242, 247)
                                                        .withOpacity(0.08);
                                                  }
                                                  if (index.isEven) {
                                                    return Color.fromARGB(
                                                        255, 237, 242, 247);
                                                  }
                                                  return null;
                                                }),
                                                cells: <DataCell>[
                                                  DataCell(Text(snapshot.data!
                                                      .docs[index]["name"])),
                                                  DataCell(
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.delete,
                                                      ),
                                                      onPressed: () {
                                                        _showMyDialog(
                                                            snapshot.data!
                                                                .docs[index].id,
                                                            "companyInitiatedActivities");
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Government initiated Activities',
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
                          height: 800,
                          width: 500,
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
                                        .collection("activities")
                                        .doc("rKjP6IlqYq6wtWzy9DeO")
                                        .collection(
                                            "governmentInitiatedActivities")
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (snapshot.data!.docs.length ==
                                          0) {
                                        return Text("no activities set yet");
                                      } else {
                                        return DataTable(
                                          columns: const <DataColumn>[
                                            DataColumn(
                                              label: Text('Name ',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 44, 82, 130),
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                            DataColumn(
                                              label: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    40, 0, 0, 0),
                                                child: Text('Action',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 44, 82, 130),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                            ),
                                          ],
                                          rows: List<DataRow>.generate(
                                            snapshot.data!.docs.length,
                                            (int index) => DataRow(
                                              color: MaterialStateProperty
                                                  .resolveWith<Color?>(
                                                      (Set<MaterialState>
                                                          states) {
                                                if (states.contains(
                                                    MaterialState.selected)) {
                                                  return Color.fromARGB(
                                                          255, 237, 242, 247)
                                                      .withOpacity(0.08);
                                                }
                                                if (index.isEven) {
                                                  return Color.fromARGB(
                                                      255, 237, 242, 247);
                                                }
                                                return null;
                                              }),
                                              cells: <DataCell>[
                                                DataCell(Text(snapshot.data!
                                                    .docs[index]["name"])),
                                                DataCell(
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            40, 0, 0, 0),
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons.delete,
                                                      ),
                                                      onPressed: () {
                                                        _showMyDialog(
                                                            snapshot.data!
                                                                .docs[index].id,
                                                            "governmentInitiatedActivities");
                                                      },
                                                    ),
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
                        ),
                      ],
                    ),
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
