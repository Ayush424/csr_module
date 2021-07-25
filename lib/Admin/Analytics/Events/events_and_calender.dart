import 'package:csr_module/Admin/Analytics/Events/events.dart';
import 'package:flutter/material.dart';

class Calender extends StatefulWidget {
  Calender({Key? key}) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  static const int numItems = 20;

  static final List<String> items = <String>[
    'Dropdown',
    '2',
    '3',
    '4',
    '5',
  ];
  String value = items.first;
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
                            const Color.fromRGBO(45, 55, 72, 1)),
                      ),
                      child: Text('Back'),
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Events()),
                          );
                        });
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
                    runSpacing: 20,
                    children: [
                      Container(
                        width: 200,
                        child: Column(
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        child: Column(
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        child: Column(
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        child: Column(
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        child: Column(
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        child: Column(
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        child: Column(
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        child: Column(
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
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Enter Amount",
                                  border: OutlineInputBorder(),
                                  // contentPadding: EdgeInsets.all(10)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Wrap(
                    spacing: 1000,
                    runSpacing: 10,
                    children: [
                      Text(
                        'Registered Employees',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 44, 82, 130),
                          decoration: TextDecoration.none,
                        ),
                      ),
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.add,
                          size: 24.0,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(45, 55, 72, 1)),
                        ),
                        label: Text('Add Employee'),
                        onPressed: () {
                          _addemployee(context);
                        },
                      ),
                    ],
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
                          columnSpacing: 240,
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(' Emp Code',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 44, 82, 130),
                                    )),
                              ),
                            ),
                            DataColumn(
                              label: Text('Name',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 44, 82, 130),
                                  )),
                            ),
                            DataColumn(
                              label: Text('Department',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 44, 82, 130),
                                  )),
                            ),
                            DataColumn(
                              label: Text('Date',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 44, 82, 130),
                                  )),
                            ),
                            DataColumn(
                              label: Text('Time',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 44, 82, 130),
                                  )),
                            ),
                          ],
                          rows: List<DataRow>.generate(
                            numItems,
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
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text('abc'),
                                )),
                                DataCell(Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text('abc'),
                                )),
                                DataCell(Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text('abc'),
                                )),
                                DataCell(Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: [
                                      Text('6 hr'),
                                      SizedBox(width: 5),
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () {
                                          _displayDialog(
                                              context, " Hours", "Name");
                                        },
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
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
                              Text("Emp Code"),
                              TextField(
                                decoration:
                                    InputDecoration(hintText: "Enter Code"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Column(
                            children: [
                              Text("Employee Name"),
                              TextField(
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
                            Text("Department"),
                            TextField(
                              decoration:
                                  InputDecoration(hintText: "Enter Department"),
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
}
