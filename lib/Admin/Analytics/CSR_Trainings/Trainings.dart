import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Trainings extends StatefulWidget {
  const Trainings({Key? key}) : super(key: key);

  @override
  _TrainingsState createState() => _TrainingsState();
}

class _TrainingsState extends State<Trainings> {
  static const int numItems = 6;

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter Hours'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Hours"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text('Edit'),
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

  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  late String dateTime;
  late double _height;
  late double _width;
  bool details = false;

  DateTime selectedDate = DateTime.now();

  TextEditingController _dateController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    setState(() {
      selectedDate = picked!;
      _dateController.text = DateFormat.yMd().format(selectedDate);
    });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Analytics - CSR  Trainings',
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
                child: Wrap(
                  spacing: 100,
                  runSpacing: 5,
                  children: [
                    Container(
                      width: 200,
                      child: Column(
                        children: [
                          Text(
                            "Training Name",
                            style: TextStyle(
                              color: Color.fromRGBO(45, 55, 72, 1),
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter Name",
                                border: OutlineInputBorder(),
                                // contentPadding: EdgeInsets.all(10)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Column(
                        children: [
                          Text(
                            "Starting Date",
                            style: TextStyle(
                              color: Color.fromRGBO(45, 55, 72, 1),
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Container(
                              width: _width / 1.7,
                              height: _height / 15,
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                                enabled: false,
                                keyboardType: TextInputType.text,
                                controller: _dateController,
                                decoration: InputDecoration(
                                    disabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none),
                                    // labelText: 'Time',
                                    contentPadding: EdgeInsets.only(top: 0.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Column(
                        children: [
                          Text(
                            "Duration",
                            style: TextStyle(
                              color: Color.fromRGBO(45, 55, 72, 1),
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter Duration",
                                border: OutlineInputBorder(),
                                // contentPadding: EdgeInsets.all(10)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Column(
                        children: [
                          Text(
                            "Training id",
                            style: TextStyle(
                              color: Color.fromRGBO(45, 55, 72, 1),
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter Unique id",
                                border: OutlineInputBorder(),
                                // contentPadding: EdgeInsets.all(10)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
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
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Trainings',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 44, 82, 130),
                  decoration: TextDecoration.none,
                ),
              ),
              Divider(
                color: Color.fromARGB(255, 226, 232, 240),
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: 1200,
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
                        stream: FirebaseFirestore.instance
                            .collection("trainings")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return CircularProgressIndicator();
                          } else if (snapshot.data!.docs.length == 0) {
                            return Text("no trainings added");
                          } else {
                            return DataTable(
                              columnSpacing: 165,
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Text('Trainings Name',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Duration',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Starting Date',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Training id',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Action',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
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
                                    DataCell(Text(snapshot
                                            .data!.docs[index]["duration"]
                                            .toString() +
                                        " hours")),
                                    DataCell(Text(snapshot
                                            .data!.docs[index]["startDate"]
                                            .toDate()
                                            .day
                                            .toString() +
                                        "/" +
                                        snapshot.data!.docs[index]["startDate"]
                                            .toDate()
                                            .month
                                            .toString() +
                                        "/" +
                                        snapshot.data!.docs[index]["startDate"]
                                            .toDate()
                                            .year
                                            .toString())),
                                    DataCell(
                                        Text(snapshot.data!.docs[index]["id"])),
                                    DataCell(
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color.fromRGBO(
                                                      45, 55, 72, 1)),
                                        ),
                                        child: Text('View more'),
                                        onPressed: () {
                                          setState(() {
                                            details = true;
                                          });
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
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              details == true
                  ? Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Analystics - CSR Trainings',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 44, 82, 130),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(1, 5, 0, 0),
                                    child: Text(
                                      '>>>>Details',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 44, 82, 130),
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        details = false;
                                      });
                                    },
                                    icon: Icon(Icons.keyboard_arrow_left),
                                    label: Text("Back"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromRGBO(
                                                  45, 55, 72, 1)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          details == false ? Text("") : Text(""),
                          Divider(
                            color: Color.fromARGB(255, 226, 232, 240),
                            thickness: 2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 150,
                            width: 1200,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color.fromARGB(255, 204, 204, 204),
                              width: 1,
                            )),
                            child: SingleChildScrollView(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                controller: ScrollController(),
                                child: DataTable(
                                  columnSpacing: 260,
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text(' Training Name ',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Duration',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Date Started',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Registered Employees',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                          )),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                    numItems,
                                    (int index) => DataRow(
                                      color: MaterialStateProperty.resolveWith<
                                          Color?>((Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.selected)) {
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
                                        DataCell(Text('abc')),
                                        DataCell(Text('xyz')),
                                        DataCell(Text('xyz')),
                                        DataCell(Text('xyz')),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 150,
                            width: 1200,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color.fromARGB(255, 204, 204, 204),
                              width: 1,
                            )),
                            child: SingleChildScrollView(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                controller: ScrollController(),
                                child: DataTable(
                                  columnSpacing: 260,
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text(' Employee Name ',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Department',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Registered On',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Hours Completed',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                          )),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                    numItems,
                                    (int index) => DataRow(
                                      color: MaterialStateProperty.resolveWith<
                                          Color?>((Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.selected)) {
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
                                        DataCell(Text('abc')),
                                        DataCell(Text('xyz')),
                                        DataCell(Text('xyz')),
                                        DataCell(Wrap(
                                          spacing: 10,
                                          children: [
                                            Text('1'),
                                            IconButton(
                                              icon: Icon(
                                                Icons.drive_file_rename_outline,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                _displayDialog(context);
                                              },
                                            ),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Text(""),
            ]),
          ),
        ),
      ),
    );
  }
}
