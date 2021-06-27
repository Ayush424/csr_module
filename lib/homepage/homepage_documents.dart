import 'package:flutter/material.dart';
import 'homepage_profile.dart';
import 'homepage_training.dart';
import 'dart:html';

class documents extends StatefulWidget {
  const documents({Key? key}) : super(key: key);

  @override
  _documentsState createState() => _documentsState();
}

class _documentsState extends State<documents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "DOCUMENTS",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Divider(
                color: Colors.black,
                height: 15,
                thickness: 8,
                indent: 5,
                endIndent: 5,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      FlatButton(
                        minWidth: 100,
                        color: Colors.grey,
                        child: Text(
                          'Profile',
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHome()),
                          );
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Colors.grey,
                        child: Text(
                          'Details',
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Colors.grey,
                        child: Text(
                          'Documents',
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => documents()),
                          );
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Colors.grey,
                        child: Text(
                          'Payroll',
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Colors.grey,
                        child: Text(
                          'Trainings',
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => training()),
                          );
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Colors.grey,
                        child: Text(
                          'History',
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            FlatButton(
                              onPressed: () => {},
                              color: const Color.fromRGBO(45, 55, 72, 1),
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(
                                    Icons.upload_sharp,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Upload",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            Text("Drag and drop here"),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all((30)),
                          child: Container(
                            width: 300,
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                TableRow(children: [
                                  Text('Cell 1'),
                                  Text('Cell 2'),
                                  Text('Cell 3'),
                                  Text('Cell 4'),
                                ]),
                                TableRow(children: [
                                  Text('Cell 4'),
                                  Text('Cell 5'),
                                  Text('Cell 6'),
                                  Text('Cell 4'),
                                ]),
                                TableRow(children: [
                                  Text('Cell 4'),
                                  Text('Cell 5'),
                                  Text('Cell 6'),
                                  Text('Cell 4'),
                                ]),
                                TableRow(children: [
                                  Text('Cell 4'),
                                  Text('Cell 5'),
                                  Text('Cell 6'),
                                  Text('Cell 4'),
                                ]),
                                TableRow(children: [
                                  Text('Cell 4'),
                                  Text('Cell 5'),
                                  Text('Cell 6'),
                                  Text('Cell 4'),
                                ]),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
