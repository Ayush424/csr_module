import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Admin/Analytics/Volunteering_Hours/volunteer_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Volunteer extends StatefulWidget {
  Volunteer({Key? key}) : super(key: key);

  @override
  _VolunteerState createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {
  static const int numItems = 20;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  List members = [];
  bool star = false;
  var date;
  String _searchText = "";
  final myController = TextEditingController();
  Future<void> _showMyDialog(String docId) async {
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
                    .collection("core_team")
                    .doc(DateTime.now().year.toString())
                    .collection("members")
                    .doc(docId)
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
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //fetchDataFromFirebase();
    date = DateTime.now();
    myController.addListener(() {
      setState(() {
        _searchText = myController.text;
      });
    });
  }

  // fetchDataFromFirebase() async {
  //   dynamic resultant = await VolunteerRepository().getMembers();
  //   if (resultant == null) {
  //   } else {
  //     setState(() {
  //       members = resultant;
  //     });
  //   }
  // }

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Volunteer',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Core Team',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 44, 82, 130),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 150,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextField(
                                controller: myController,
                                decoration: InputDecoration(
                                  // labelText: "Search",
                                  hintText: "Search ",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 113, 128, 150))),
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 204, 204, 204),
                                  ),
                                  focusColor:
                                      Color.fromARGB(255, 204, 204, 204),
                                  fillColor: Color.fromARGB(255, 204, 204, 204),
                                  suffixIcon: _searchText.isNotEmpty
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.clear,
                                            color: Color.fromARGB(
                                                255, 113, 128, 150),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              myController.clear();
                                            });
                                          },
                                        )
                                      : IconButton(
                                          icon: Icon(
                                            Icons.search,
                                            color: Color.fromARGB(
                                                255, 113, 128, 150),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              Color.fromARGB(
                                                  255, 113, 128, 150);
                                              // myController.search();
                                            });
                                          },
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                              Container(
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('core_team')
                                      .doc(DateTime.now().year.toString())
                                      .collection("members")
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    } else if (snapshot.data!.docs.length ==
                                        0) {
                                      return Center(
                                        child: Text(
                                          "Core Team for this year not set yet, ask admin to set it.",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 44, 82, 130)),
                                        ),
                                      );
                                    } else {
                                      return DataTable(
                                        columns: const <DataColumn>[
                                          DataColumn(
                                            label: Text('Name',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          DataColumn(
                                            label: Text('Department',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          DataColumn(
                                            label: Text('Action',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                  fontWeight: FontWeight.bold,
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
                                              DataCell(Text(snapshot
                                                  .data!.docs[index]["name"])),
                                              DataCell(Text(snapshot.data!
                                                  .docs[index]["department"])),
                                              DataCell(
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.delete,
                                                  ),
                                                  onPressed: () {
                                                    _showMyDialog(snapshot
                                                        .data!.docs[index].id);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Volunteers',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 44, 82, 130),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 150,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextField(
                                controller: myController,
                                decoration: InputDecoration(
                                  // labelText: "Search",
                                  hintText: "Search ",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 113, 128, 150))),
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 204, 204, 204),
                                  ),
                                  focusColor:
                                      Color.fromARGB(255, 204, 204, 204),
                                  fillColor: Color.fromARGB(255, 204, 204, 204),
                                  suffixIcon: _searchText.isNotEmpty
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.clear,
                                            color: Color.fromARGB(
                                                255, 113, 128, 150),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              myController.clear();
                                            });
                                          },
                                        )
                                      : IconButton(
                                          icon: Icon(
                                            Icons.search,
                                            color: Color.fromARGB(
                                                255, 113, 128, 150),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              Color.fromARGB(
                                                  255, 113, 128, 150);
                                              // myController.search();
                                            });
                                          },
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                          child: Container(
                            width: 1200,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("CsrRegistraionDetails")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.data!.docs.length == 0) {
                                    return Center(
                                      child: Text(
                                        "No pending requests",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 44, 82, 130)),
                                      ),
                                    );
                                  } else {
                                    return DataTable(
                                      columnSpacing: 85,
                                      columns: const <DataColumn>[
                                        DataColumn(
                                          label: Text('Emp Code',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 82, 130),
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text('Name',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 82, 130),
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text('Department',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 82, 130),
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text('Area of Interest 1',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 82, 130),
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text('Area of Interest 2',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 82, 130),
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text('Action',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 82, 130),
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text('Action',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 82, 130),
                                                fontWeight: FontWeight.bold,
                                              )),
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
                                            DataCell(Text(snapshot
                                                .data!.docs[index]["empcode"])),
                                            DataCell(Text(snapshot
                                                .data!.docs[index]["name"])),
                                            DataCell(Text(snapshot.data!
                                                .docs[index]["department"])),
                                            DataCell(Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                  snapshot.data!.docs[index]
                                                      ["areaOfInterest1"]),
                                            )),
                                            DataCell(Text(
                                                snapshot.data!.docs[index]
                                                    ["areaOfInterest2"])),
                                            DataCell(IconButton(
                                              padding: EdgeInsets.all(0),
                                              icon: Icon(Icons.check,
                                                  color: Colors.green,
                                                  size: 20),
                                              onPressed: () {
                                                String docId = snapshot
                                                    .data!.docs[index].id;
                                                FirebaseFirestore.instance
                                                    .collection("core_team")
                                                    .doc(DateTime.now()
                                                        .year
                                                        .toString())
                                                    .collection("members")
                                                    .add({
                                                  "uId": snapshot
                                                      .data!.docs[index]["uId"],
                                                  "department":
                                                      snapshot.data!.docs[index]
                                                          ["department"],
                                                  "name": snapshot
                                                      .data!.docs[index]["name"]
                                                }).then((result) {
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          "CsrRegistraionDetails")
                                                      .doc(docId)
                                                      .delete();
                                                  return showDialog<String>(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                      content: SizedBox(
                                                        height: 150,
                                                        child: Center(
                                                          child: Text(
                                                            'added Successfully',
                                                            style: TextStyle(
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context,
                                                                  'OK'),
                                                          child:
                                                              const Text('OK'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                              },
                                            )),
                                            DataCell(IconButton(
                                              padding: EdgeInsets.all(0),
                                              icon: Icon(Icons.close,
                                                  color: Colors.red, size: 20),
                                              onPressed: () {
                                                String docId = snapshot
                                                    .data!.docs[index].id;
                                                FirebaseFirestore.instance
                                                    .collection(
                                                        "CsrRegistraionDetails")
                                                    .doc(docId)
                                                    .delete();
                                              },
                                            )),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
