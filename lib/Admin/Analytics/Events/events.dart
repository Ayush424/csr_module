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
  static final List<String> items1 = <String>[
    'Dropdown',
    '2',
    '3',
    '4',
    '5',
  ];
  String value1 = items1.first;
  static final List<String> items2 = <String>[
    'Dropdown',
    '2',
    '3',
    '4',
    '5',
  ];
  String value2 = items2.first;
  static final List<String> items3 = <String>[
    'Dropdown',
    '2',
    '3',
    '4',
    '5',
  ];
  String value3 = items3.first;
  Future<void> _Pending() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pending'),
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
                print('Confirmed');
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
      if (picked == null) {
        selectedDate = DateTime.now();
      } else
        selectedDate = picked;
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
            child: Column(
              children: [
                Wrap(children: [
                  Wrap(
                    spacing: 900,
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
                      spacing: 100,
                      runSpacing: 5,
                      children: [
                        Container(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Event Names",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: DropdownButton<String>(
                                  value: value,
                                  items: items
                                      .map((item) => DropdownMenuItem<String>(
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
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
                                        contentPadding:
                                            EdgeInsets.only(top: 0.0)),
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
                                "NGO Partner",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: DropdownButton<String>(
                                  value: value1,
                                  items: items1
                                      .map((item1) => DropdownMenuItem<String>(
                                            child: Text(
                                              item1,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ),
                                            ),
                                            value: item1,
                                          ))
                                      .toList(),
                                  onChanged: (value1) => setState(() {
                                    this.value1 = value1!;
                                  }),
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
                                "Duration",
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Attendees Count",
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
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Enter Count",
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
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: DropdownButton<String>(
                                  value: value2,
                                  items: items2
                                      .map((item2) => DropdownMenuItem<String>(
                                            child: Text(
                                              item2,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ),
                                            ),
                                            value: item2,
                                          ))
                                      .toList(),
                                  onChanged: (value2) => setState(() {
                                    this.value2 = value2!;
                                  }),
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
                                "Event Type",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: DropdownButton<String>(
                                  value: value3,
                                  items: items3
                                      .map((item3) => DropdownMenuItem<String>(
                                            child: Text(
                                              item3,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ),
                                            ),
                                            value: item3,
                                          ))
                                      .toList(),
                                  onChanged: (value3) => setState(() {
                                    this.value3 = value3!;
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
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
                              setState(() {});
                            },
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
                    child: SingleChildScrollView(
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columnSpacing: 112,
                            columns: const <DataColumn>[
                              DataColumn(
                                label: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(' Event Name',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                              ),
                              DataColumn(
                                label: Text('Duration',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 44, 82, 130),
                                    )),
                              ),
                              DataColumn(
                                label: Text('Date Started',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 44, 82, 130),
                                    )),
                              ),
                              DataColumn(
                                label: Text('NGO Partner',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 44, 82, 130),
                                    )),
                              ),
                              DataColumn(
                                label: Text('Attendees Count',
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
                              numItems,
                              (int index) => DataRow(
                                color:
                                    MaterialStateProperty.resolveWith<Color?>(
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
                                        widget.update!("eventsandcalendar");
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
