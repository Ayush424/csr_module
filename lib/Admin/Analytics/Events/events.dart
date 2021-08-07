import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Admin/Analytics/Events/event_global_value.dart';
import 'package:flutter/material.dart';
import 'events_and_calender.dart';
import 'package:intl/intl.dart';

class EventsAdmin extends StatefulWidget {
  final ValueChanged<String>? update;
  EventsAdmin({Key? key, this.update}) : super(key: key);

  @override
  _EventsAdminState createState() => _EventsAdminState();
}

class _EventsAdminState extends State<EventsAdmin> {
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  static const int numItems = 20;
  static const int Items = 3;
  static final List<String> items = <String>[
    'Dropdown',
    '2',
    '3',
    '4',
    '5',
  ];
  String value = items.first;
  static final List<String> ngoitems = <String>[
    'Select NGO',
    'raasta',
    'SD',
    'sanskaar',
  ];
  String ngovalue = ngoitems.first;
  static final List<String> items2 = <String>[
    'Dropdown',
    '2',
    '3',
    '4',
    '5',
  ];
  String value2 = items2.first;
  static final List<String> eventType = <String>[
    'Select Event Type',
    'Cultural',
    'Social',
  ];
  String typeValue = eventType.first;
  Future<void> _Pending() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Pending')),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text('Emp Code',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 44, 82, 130),
                                  )),
                            ),
                          ),
                          DataColumn(
                            label: Text('Employee Name',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                )),
                          ),
                          DataColumn(
                            label: Text('Ngo Partner',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                )),
                          ),
                          DataColumn(
                            label: Text('Event Name',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                )),
                          ),
                          DataColumn(
                            label: Text('Date of Event',
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
                          DataColumn(
                            label: Text('Action',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                )),
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          Items,
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
                              DataCell(Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('abc'),
                              )),
                              DataCell(Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('abc'),
                              )),
                              DataCell(Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('abc'),
                              )),
                              DataCell(Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('abc'),
                              )),
                              DataCell(Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('abc'),
                              )),
                              DataCell(IconButton(
                                padding: EdgeInsets.all(0),
                                icon: Icon(Icons.check,
                                    color: Colors.green, size: 20),
                                onPressed: () {},
                              )),
                              DataCell(IconButton(
                                padding: EdgeInsets.all(0),
                                icon: Icon(Icons.close,
                                    color: Colors.red, size: 20),
                                onPressed: () {},
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
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 42, 67, 101),
                ),
              ),
              child: Text('Approve All'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 42, 67, 101),
                ),
              ),
              child: Text('Deny All'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 100,
            height: 100,
            child: Center(
                child: Text(
              'Event Added Successfully',
              style: TextStyle(fontSize: 20),
            )),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  late String dateTime;
  late double _height;
  late double _width;
  bool details = false;

  DateTime selectedDate = DateTime.now();

  TextEditingController _dateController = TextEditingController();
  TextEditingController _dateController2 = TextEditingController();

  Future<Null> _selectDate(
      BuildContext context, TextEditingController dateController) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    setState(() {
      if (picked == null) {
        selectedDate = DateTime.now();
      } else
        selectedDate = picked;
      dateController.text = DateFormat.yMd().format(selectedDate);
    });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _dateController2.text = DateFormat.yMd().format(DateTime.now());
    super.initState();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _deptController = TextEditingController();
  final TextEditingController _countController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
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
            child: Column(
              children: [
                Wrap(children: [
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
                              const Color.fromRGBO(255, 75, 162, 1)),
                        ),
                        child: Text('Request Pending'),
                        onPressed: () {
                          _Pending();
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
                  Container(
                    child: Wrap(
                      spacing: 110,
                      runSpacing: 5,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
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
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: TextFormField(
                                  controller: _nameController,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Enter Event Name",
                                    border: OutlineInputBorder(),
                                    // contentPadding: EdgeInsets.all(10)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
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
                              InkWell(
                                onTap: () {
                                  _selectDate(context, _dateController);
                                },
                                child: Container(
                                  width: _width / 1.7,
                                  height: _height / 13,
                                  margin: EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Colors.grey,
                                      )),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                    enabled: false,
                                    keyboardType: TextInputType.text,
                                    controller: _dateController,
                                    decoration: InputDecoration(
                                        disabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide.none),
                                        // labelText: 'Time',
                                        contentPadding:
                                            EdgeInsets.only(top: 0.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
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
                              SizedBox(
                                height: 10,
                              ),
                              Container(
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
                                    value: ngovalue,
                                    items: ngoitems
                                        .map((ngoitem) =>
                                            DropdownMenuItem<String>(
                                              child: Text(
                                                ngoitem,
                                                style: TextStyle(

                                                    // fontSize: 10,
                                                    ),
                                              ),
                                              value: ngoitem,
                                            ))
                                        .toList(),
                                    onChanged: (ngovalue) => setState(() {
                                      this.ngovalue = ngovalue!;
                                    }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
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
                              InkWell(
                                onTap: () {
                                  _selectDate(context, _dateController2);
                                },
                                child: Container(
                                  width: _width / 1.7,
                                  height: _height / 13,
                                  margin: EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Colors.grey,
                                      )),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                    enabled: false,
                                    keyboardType: TextInputType.text,
                                    controller: _dateController2,
                                    decoration: InputDecoration(
                                        disabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide.none),
                                        // labelText: 'Time',
                                        contentPadding:
                                            EdgeInsets.only(top: 0.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: TextFormField(
                                  controller: _countController,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Enter Description",
                                    border: OutlineInputBorder(),
                                    // contentPadding: EdgeInsets.all(10)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
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
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: TextFormField(
                                  controller: _budgetController,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Enter Budget",
                                    border: OutlineInputBorder(),
                                    // contentPadding: EdgeInsets.all(10)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
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
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: TextFormField(
                                  controller: _deptController,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Enter Dept",
                                    border: OutlineInputBorder(),
                                    // contentPadding: EdgeInsets.all(10)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
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
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 250,
                                height: 50,
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: typeValue,
                                    items: eventType
                                        .map(
                                            (item3) => DropdownMenuItem<String>(
                                                  child: Text(
                                                    item3,
                                                    style: TextStyle(
                                                        // fontWeight: FontWeight.bold,
                                                        // fontSize: 10,
                                                        ),
                                                  ),
                                                  value: item3,
                                                ))
                                        .toList(),
                                    onChanged: (typeValue) => setState(() {
                                      this.typeValue = typeValue!;
                                    }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
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
                                if (_nameController.text.isNotEmpty &&
                                    ngovalue != "Select NGO" &&
                                    _budgetController.text.isNotEmpty &&
                                    _deptController.text.isNotEmpty &&
                                    typeValue != "Select Event Type") {
                                  var startDateFormat = DateFormat("dd/MM/yyyy")
                                      .parse(_dateController.text);
                                  var endDateFormat = DateFormat("dd/MM/yyyy")
                                      .parse(_dateController.text);
                                  Timestamp startDate =
                                      Timestamp.fromDate(startDateFormat);
                                  Timestamp endDate =
                                      Timestamp.fromDate(endDateFormat);
                                  Map<String, dynamic> entry = {
                                    "desc": _countController.text,
                                    "name": _nameController.text,
                                    "startdate": startDate,
                                    "ngoPartner": ngovalue,
                                    "endDate": endDate,
                                    "budget": int.parse(_budgetController.text),
                                    "deptIncharge": _deptController.text,
                                    "eventType": typeValue,
                                    "team": [],
                                    "actualSpent": 0,
                                  };
                                  FirebaseFirestore.instance
                                      .collection("events")
                                      .add(entry)
                                      .then((value) => _showMyDialog());
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            content: Text(
                                              'Please fill all the fields',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ));
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'CSR Events',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 44, 82, 130),
                        decoration: TextDecoration.none,
                      ),
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
                            child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("events")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.data!.docs.length == 0) {
                                    return Text("no events to show");
                                  } else {
                                    return ConstrainedBox(
                                      constraints: BoxConstraints(
                                          minWidth: constraints.minWidth),
                                      child: DataTable(
                                        columnSpacing: 112,
                                        columns: const <DataColumn>[
                                          DataColumn(
                                            label: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Text(' Event Name',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 44, 82, 130),
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text('Duration',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          DataColumn(
                                            label: Text('Date Started',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          DataColumn(
                                            label: Text('NGO Partner',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          DataColumn(
                                            label: Text('Attendees Count',
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
                                              DataCell(Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Text(snapshot
                                                    .data!.docs[index]["name"]),
                                              )),
                                              DataCell(Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Text(snapshot.data!
                                                        .docs[index]["endDate"]
                                                        .toDate()
                                                        .difference(snapshot
                                                            .data!
                                                            .docs[index]
                                                                ["startdate"]
                                                            .toDate())
                                                        .inDays
                                                        .toString() +
                                                    " days"),
                                              )),
                                              DataCell(Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Text(snapshot
                                                        .data!
                                                        .docs[index]
                                                            ["startdate"]
                                                        .toDate()
                                                        .day
                                                        .toString() +
                                                    "/" +
                                                    snapshot
                                                        .data!
                                                        .docs[index]
                                                            ["startdate"]
                                                        .toDate()
                                                        .month
                                                        .toString() +
                                                    "/" +
                                                    snapshot
                                                        .data!
                                                        .docs[index]
                                                            ["startdate"]
                                                        .toDate()
                                                        .year
                                                        .toString()),
                                              )),
                                              DataCell(Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Text(snapshot.data!
                                                    .docs[index]["ngoPartner"]),
                                              )),
                                              DataCell(Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Text(snapshot.data!
                                                    .docs[index]["team"].length
                                                    .toString()),
                                              )),
                                              DataCell(
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(const Color
                                                                    .fromRGBO(
                                                                45, 55, 72, 1)),
                                                  ),
                                                  child: Text('View more'),
                                                  onPressed: () {
                                                    EventGlobalValue
                                                        .eventValue = index;
                                                    EventGlobalValue.doc =
                                                        snapshot.data!
                                                            .docs[index].id;
                                                    widget.update!(
                                                        "eventsandcalendar");
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
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
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
