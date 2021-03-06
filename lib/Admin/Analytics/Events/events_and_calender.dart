import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Admin/Analytics/Events/event_global_value.dart';
import 'package:csr_module/Admin/Analytics/Events/events.dart';
import 'package:flutter/material.dart';

class Calender extends StatefulWidget {
  final ValueChanged<String>? update;
  Calender({Key? key, this.update}) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  static const int numItems = 20;
  final TextEditingController _textFieldController = TextEditingController();

  static final List<String> eventtype = <String>[
    'Select Event Type',
    'Cultural',
    'Social',
  ];
  String eventTypevalue = eventtype.first;
  static final List<String> incharge = <String>[
    'Dropdown',
    '2',
    '3',
    '4',
    '5',
  ];
  String inchargevalue = incharge.first;

  Future<void> _displayDialogEventTypeEdit(
    BuildContext context,
    String details,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Select Event Type',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          content: StatefulBuilder(builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Container(
              height: 100,
              width: 100,
              child: Center(
                child: Container(
                  width: 250,
                  height: 50,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      focusColor: Color.fromARGB(255, 113, 128, 150),
                      value: eventTypevalue,
                      items: eventtype
                          .map((eventtype) => DropdownMenuItem<String>(
                                child: Text(
                                  eventtype,
                                  style: TextStyle(
                                    color: Colors.black,
                                    //fontSize: 10,
                                  ),
                                ),
                                value: eventtype,
                              ))
                          .toList(),
                      onChanged: (eventTypevalue) => setState(() {
                        this.eventTypevalue = eventTypevalue!;
                      }),
                    ),
                  ),
                ),
              ),
            );
          }),
          actions: <Widget>[
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("events")
                    .doc(EventGlobalValue.doc)
                    .update({"eventType": eventTypevalue});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _displayDialogIncharge(
    BuildContext context,
    String details,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Select  ' + details,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          content: StatefulBuilder(builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Container(
              height: 100,
              width: 100,
              child: Center(
                child: Container(
                  width: 250,
                  height: 50,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      focusColor: Color.fromARGB(255, 113, 128, 150),
                      value: inchargevalue,
                      items: incharge
                          .map((item) => DropdownMenuItem<String>(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: Colors.black,
                                    //fontSize: 10,
                                  ),
                                ),
                                value: item,
                              ))
                          .toList(),
                      onChanged: (value) => setState(() {
                        this.inchargevalue = value!;
                      }),
                    ),
                  ),
                ),
              ),
            );
          }),
          actions: <Widget>[
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("events")
                    .doc(EventGlobalValue.doc)
                    .update({"deptIncharge": inchargevalue});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _displayDialogEdit(
      BuildContext context, String details, String firestoreValue) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter" + details),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Changed Value"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text('Save'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(45, 55, 72, 1)),
                ),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("events")
                      .doc(EventGlobalValue.doc)
                      .update({
                    "$firestoreValue": int.parse(_textFieldController.text)
                  });
                  _textFieldController.clear();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 700,
                  runSpacing: 20,
                  children: [
                    Text(
                      'Events & Calendar',
                      style: TextStyle(
                        fontSize: 36,
                        color: Color.fromARGB(255, 42, 67, 101),
                        decoration: TextDecoration.none,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(45, 55, 72, 1)),
                      ),
                      child: Text('Back'),
                      onPressed: () {
                        widget.update!("calender");
                      },
                    ),
                  ],
                ),
                Divider(
                  color: Color.fromARGB(255, 226, 232, 240),
                  thickness: 2,
                ),
                const SizedBox(
                  height: 50,
                ),
                StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("events")
                        .doc(EventGlobalValue.doc)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null)
                        return CircularProgressIndicator();
                      return Container(
                        child: Wrap(
                          spacing: 110,
                          runSpacing: 5,
                          children: [
                            Container(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Event Name",
                                    style: TextStyle(
                                      color: Color.fromRGBO(45, 55, 72, 1),
                                      decoration: TextDecoration.none,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Container(
                                      height: 53,
                                      width: 250,
                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 4,
                                            child: Text(
                                              snapshot.data!["name"],
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Flexible(flex: 1, child: Text('')),
                                        ],
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
                                    "Event Date",
                                    style: TextStyle(
                                      color: Color.fromRGBO(45, 55, 72, 1),
                                      decoration: TextDecoration.none,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Container(
                                      height: 53,
                                      width: 250,
                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 4,
                                            child: Text(
                                              snapshot.data!["startdate"]
                                                      .toDate()
                                                      .day
                                                      .toString() +
                                                  "/" +
                                                  snapshot.data!["startdate"]
                                                      .toDate()
                                                      .month
                                                      .toString() +
                                                  "/" +
                                                  snapshot.data!["startdate"]
                                                      .toDate()
                                                      .year
                                                      .toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Flexible(flex: 1, child: Text('')),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // InkWell(
                                  //   onTap: () {
                                  //     _selectDate(context);
                                  //   },
                                  //   child: Container(
                                  //     width: _width / 1.7,
                                  //     height: _height / 15,
                                  //     margin: EdgeInsets.only(top: 10),
                                  //     alignment: Alignment.center,
                                  //     decoration: BoxDecoration(
                                  //         border: Border.all(color: Colors.grey)),
                                  //     child: TextFormField(
                                  //       style: TextStyle(fontSize: 15),
                                  //       textAlign: TextAlign.center,
                                  //       enabled: false,
                                  //       keyboardType: TextInputType.text,
                                  //       controller: _dateController,
                                  //       decoration: InputDecoration(
                                  //           disabledBorder: UnderlineInputBorder(
                                  //               borderSide: BorderSide.none),
                                  //           // labelText: 'Time',
                                  //           contentPadding:
                                  //               EdgeInsets.only(top: 0.0)),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Event Type",
                                    style: TextStyle(
                                      color: Color.fromRGBO(45, 55, 72, 1),
                                      decoration: TextDecoration.none,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Container(
                                      height: 53,
                                      width: 250,
                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 4,
                                            child: Text(
                                              snapshot.data!["eventType"],
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                              onPressed: () {
                                                _displayDialogEventTypeEdit(
                                                    context, "Event");
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   width: 200,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         "Duration (hrs)",
                            //         style: TextStyle(
                            //           color: Color.fromRGBO(45, 55, 72, 1),
                            //           decoration: TextDecoration.none,
                            //           fontSize: 20,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(
                            //             top: 10, bottom: 10),
                            //         child: Container(
                            //           height: 53,
                            //           width: 250,
                            //           padding: EdgeInsets.only(left: 10),
                            //           decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(4),
                            //               border:
                            //                   Border.all(color: Colors.grey)),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Flexible(
                            //                 flex: 4,
                            //                 child: Text(
                            //                   '6  ',
                            //                   style: TextStyle(
                            //                     fontSize: 16,
                            //                   ),
                            //                 ),
                            //               ),
                            //               Flexible(
                            //                 flex: 1,
                            //                 child: IconButton(
                            //                   icon: Icon(
                            //                     Icons.edit,
                            //                   ),
                            //                   onPressed: () {
                            //                     _displayDialogEdit(
                            //                         context, " Duration");
                            //                   },
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: 200,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         "Attendees Count",
                            //         style: TextStyle(
                            //           color: Color.fromRGBO(45, 55, 72, 1),
                            //           decoration: TextDecoration.none,
                            //           fontSize: 20,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(
                            //             top: 10, bottom: 10),
                            //         child: Container(
                            //           height: 53,
                            //           width: 250,
                            //           padding: EdgeInsets.only(left: 10),
                            //           decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(4),
                            //               border:
                            //                   Border.all(color: Colors.grey)),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Flexible(
                            //                 flex: 4,
                            //                 child: Text(
                            //                   '250  ',
                            //                   style: TextStyle(
                            //                     fontSize: 16,
                            //                   ),
                            //                 ),
                            //               ),
                            //               Flexible(
                            //                 flex: 1,
                            //                 child: IconButton(
                            //                   icon: Icon(
                            //                     Icons.edit,
                            //                   ),
                            //                   onPressed: () {
                            //                     _displayDialogEdit(context,
                            //                         " New Attendees Count");
                            //                   },
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Container(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "NGO Partner",
                                    style: TextStyle(
                                      color: Color.fromRGBO(45, 55, 72, 1),
                                      decoration: TextDecoration.none,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Container(
                                      height: 53,
                                      width: 250,
                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 4,
                                            child: Text(
                                              snapshot.data!["ngoPartner"],
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Text(''),
                                          ),
                                        ],
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
                                    "Department Incharge",
                                    style: TextStyle(
                                      color: Color.fromRGBO(45, 55, 72, 1),
                                      decoration: TextDecoration.none,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Container(
                                      height: 53,
                                      width: 250,
                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 4,
                                            child: Text(
                                              snapshot.data!["deptIncharge"],
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                              onPressed: () {
                                                _displayDialogIncharge(context,
                                                    "Departmental Incharge");
                                              },
                                            ),
                                          ),
                                        ],
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
                                    "Event Budget",
                                    style: TextStyle(
                                      color: Color.fromRGBO(45, 55, 72, 1),
                                      decoration: TextDecoration.none,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Container(
                                      height: 53,
                                      width: 250,
                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 4,
                                            child: Text(
                                              snapshot.data!["budget"]
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                              onPressed: () {
                                                _displayDialogEdit(
                                                    context,
                                                    " New Event Budget",
                                                    "budget");
                                              },
                                            ),
                                          ),
                                        ],
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
                                    "Actual Spent",
                                    style: TextStyle(
                                      color: Color.fromRGBO(45, 55, 72, 1),
                                      decoration: TextDecoration.none,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Container(
                                      height: 53,
                                      width: 250,
                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 4,
                                            child: Text(
                                              snapshot.data!["actualSpent"]
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                              onPressed: () {
                                                _displayDialogEdit(
                                                    context,
                                                    " Correct Actual spent",
                                                    "actualSpent");
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ListTile(
                    title: Text(
                      'Registered Employees',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 44, 82, 130),
                        decoration: TextDecoration.none,
                      ),
                    ),
                    trailing: GestureDetector(
                        child: Chip(
                          backgroundColor: Color.fromRGBO(45, 55, 72, 1),
                          label: const SizedBox(
                            height: 35,
                            width: 140,
                            child: Center(
                              child: Text(
                                "Add Employee",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
                          _addemployee(context);
                        }),
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
                  height: 200,
                  width: 1400,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Color.fromARGB(255, 204, 204, 204),
                    width: 1,
                  )),
                  child: LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      controller: ScrollController(),
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints(minWidth: constraints.minWidth),
                            child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("events")
                                    .doc(EventGlobalValue.doc)
                                    .collection("Volunteer Report")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null)
                                    return CircularProgressIndicator();
                                  else if (snapshot.data!.docs.length == 0) {
                                    return Text("noone registered yet");
                                  } else {
                                    return DataTable(
                                      columnSpacing: 150,
                                      columns: const <DataColumn>[
                                        DataColumn(
                                          label: Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Text(' Emp Code',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                )),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text('Name',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 44, 82, 130),
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text('Department',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 44, 82, 130),
                                              )),
                                        ),
                                        DataColumn(
                                          label: Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text('Date',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                )),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text('Time',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                )),
                                          ),
                                        ),
                                      ],
                                      rows: List<DataRow>.generate(
                                        snapshot.data!.docs.length,
                                        (int index) => DataRow(
                                          color: MaterialStateProperty
                                              .resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
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
                                            DataCell(Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text(snapshot.data!
                                                  .docs[index]["empCode"]),
                                            )),
                                            DataCell(Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Text(snapshot
                                                  .data!.docs[index]["name"]),
                                            )),
                                            DataCell(Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Text(snapshot
                                                  .data!.docs[index]["dept"]),
                                            )),
                                            DataCell(Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text(snapshot
                                                      .data!.docs[index]["date"]
                                                      .toDate()
                                                      .day
                                                      .toString() +
                                                  "/" +
                                                  snapshot
                                                      .data!.docs[index]["date"]
                                                      .toDate()
                                                      .month
                                                      .toString() +
                                                  "/" +
                                                  snapshot
                                                      .data!.docs[index]["date"]
                                                      .toDate()
                                                      .year
                                                      .toString()),
                                            )),
                                            DataCell(Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Row(
                                                children: [
                                                  Text(snapshot.data!
                                                          .docs[index]["hours"]
                                                          .toString() +
                                                      " hr"),
                                                  SizedBox(width: 5),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.edit,
                                                    ),
                                                    onPressed: () {
                                                      _changeHours(
                                                          context,
                                                          snapshot.data!
                                                              .docs[index].id);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            )),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _addemployee(BuildContext context) async {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _codeController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              width: 400,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          child: Column(
                            children: [
                              Text(
                                "Emp Code",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: TextField(
                                  controller: _codeController,
                                  decoration:
                                      InputDecoration(hintText: "Enter Code"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Column(
                            children: [
                              Text(
                                "Employee Name",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextField(
                                controller: _nameController,
                                decoration:
                                    InputDecoration(hintText: "Enter Name"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: Container(
                        width: 100,
                        child: Column(
                          children: [
                            Text(
                              "Department",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              controller: categoryController,
                              decoration: InputDecoration(
                                hintText: "Enter Category",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text('Add'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(45, 55, 72, 1)),
                ),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("events")
                      .doc(EventGlobalValue.doc)
                      .collection("Volunteer Report")
                      .add({
                    "assignedBy": "admin",
                    "date": Timestamp.fromDate(DateTime.now()),
                    "dept": categoryController.text,
                    "empCode": _codeController.text,
                    "hours": 0,
                    "name": _nameController.text,
                  }).then((value) async {
                    DocumentSnapshot data = await FirebaseFirestore.instance
                        .collection("events")
                        .doc(EventGlobalValue.doc)
                        .get();
                    Map<String, dynamic> name = data.get("team");
                    name.putIfAbsent(
                        _codeController.text, () => _nameController.text);
                    FirebaseFirestore.instance
                        .collection("events")
                        .doc(EventGlobalValue.doc)
                        .update({"team": name});
                  });

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _displayDialog(BuildContext context, String details, String field) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter" + details),
            content: TextField(
              decoration: InputDecoration(hintText: "Changed Value"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text('Save'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(45, 55, 72, 1)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _changeHours(BuildContext context, String docId) async {
    TextEditingController controller = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter hours"),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "Changed Value"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text('Save'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(45, 55, 72, 1)),
                ),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("events")
                      .doc(EventGlobalValue.doc)
                      .collection("Volunteer Report")
                      .doc(docId)
                      .update({"hours": int.parse(controller.text)});
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
