import 'package:flutter/material.dart';
import 'homepage_profile.dart';
import 'homepage_training.dart';
import 'homepage_payroll.dart';

import 'dart:html';

class documents extends StatefulWidget {
  const documents({Key? key}) : super(key: key);

  @override
  _documentsState createState() => _documentsState();
}

class _documentsState extends State<documents> {

  @override


  Widget build(BuildContext context) {
    return Container(
      child:ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("MY HOME",
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 42, 67, 101),
                    fontWeight: FontWeight.bold),),
            ],
          ),

          Divider(
            color: Colors.black,
            height: 1,
            thickness: 1,
            indent: 1,
            endIndent: 1,
          ),



          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      FlatButton(
                        minWidth: 100,
                        color: Color.fromRGBO(229, 229, 229,1),
                        child: Text(
                          'Profile',
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => profile()),
                          );
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Color.fromRGBO(229, 229, 229,1),
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
                        color: Color.fromRGBO(229, 229, 229,1),
                        child: Text(
                          'Documents',
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => documents()),
                          );
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Color.fromRGBO(229, 229, 229,1),
                        child: Text(
                          'Payroll',
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => payroll()),
                          );
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Color.fromRGBO(229, 229, 229,1),
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
                        color: Color.fromRGBO(229, 229, 229,1),
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
                                                    child: Column( // Replace with a Row for horizontal icon + text
                                                      children: <Widget>[

                                                        Icon(Icons.upload_sharp,
                                                          color: Colors.white,
                                                        ),
                                                        Text("Upload",
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
                            width:600,
                            child:  DataTable( columns: [
                              DataColumn(label: Text('DOCUMENT')),
                              DataColumn(label: Text('TYPE')),
                              DataColumn(label: Text('ACTION')),
                            ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('1')),
                                  DataCell(Text('doc')),
                                  DataCell(Icon(Icons.delete)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('2')),
                                  DataCell(Text("pdf")),
                                  DataCell(Icon(Icons.delete)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('2')),
                                  DataCell(Text('pdf')),
                                  DataCell(Icon(Icons.delete)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('3')),
                                  DataCell(Text('img')),
                                  DataCell(Icon(Icons.delete)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('4')),
                                  DataCell(Text("img")),
                                  DataCell(Icon(Icons.delete)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('5')),
                                  DataCell(Text('pdf')),
                                  DataCell(Icon(Icons.delete)),

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





