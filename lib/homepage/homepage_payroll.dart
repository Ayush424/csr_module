import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class HomePayroll extends StatefulWidget {
  const HomePayroll({Key? key}) : super(key: key);

  @override
  _HomePayrollState createState() => _HomePayrollState();
}

class _HomePayrollState extends State<HomePayroll> {
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  static final List<String> items = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  bool add = false;

  String value = items.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all((20)),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Color.fromARGB(255, 204, 204, 204),
                          width: 1,
                        )),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DataTable(
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text('Name',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                  DataColumn(
                                    label: Text('Department',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
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
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 4.0,
                        children: [
                          ElevatedButton.icon(
                            icon: Icon(
                              Icons.edit,
                              size: 24.0,
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(45, 55, 72, 1)),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(10)),
                            ),
                            label: Text('Request Edit'),
                            onPressed: () {},
                          ),
                          SizedBox(width: 30),
                          ElevatedButton.icon(
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
                              setState(() {
                                add = true;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    add == true
                        ? Center(
                            child: Container(
                              height: 200,
                              decoration: new BoxDecoration(
                                color: Color.fromARGB(255, 237, 242, 247),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 50, 30, 50),
                                child: Wrap(
                                  spacing: 200,
                                  runSpacing: 30,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "NGO",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 55, 72, 1)),
                                          ),
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white,
                                            ),
                                            child: DropdownButton<String>(
                                              value: value,
                                              items: items
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        value: item,
                                                      ))
                                                  .toList(),
                                              onChanged: (value) =>
                                                  setState(() {
                                                this.value = value!;
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Period",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 55, 72, 1)),
                                          ),
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white,
                                            ),
                                            child: DropdownButton<String>(
                                              value: value,
                                              items: items
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        value: item,
                                                      ))
                                                  .toList(),
                                              onChanged: (value) =>
                                                  setState(() {
                                                this.value = value!;
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Amount",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 55, 72, 1)),
                                          ),
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white,
                                            ),
                                            child: DropdownButton<String>(
                                              value: value,
                                              items: items
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        value: item,
                                                      ))
                                                  .toList(),
                                              onChanged: (value) =>
                                                  setState(() {
                                                this.value = value!;
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 42, 67, 101)),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              add = false;
                                            });
                                          },
                                          child: const Text("Done")),
                                    ),
                                    add == false ? Text("Done") : Text(""),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Text(""),
                    //ok bye
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
