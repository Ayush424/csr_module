import 'package:flutter/material.dart';
import 'homepage_profile.dart';
import 'homepage_training.dart';
import 'homepage_documents.dart';

import 'dart:html';

class payroll extends StatefulWidget {
  const payroll({Key? key}) : super(key: key);

  @override
  _payrollState createState() => _payrollState();
}

class _payrollState extends State<payroll> {
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
                    fontWeight: FontWeight.bold),

              ),

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


                        Padding(
                          padding: EdgeInsets.all((30)),
                          child: Container(
                            width:300,
                            child: DataTable( columns: [
                              DataColumn(label: Text('NAME')),
                              DataColumn(label: Text('AMOUNT')),
                              DataColumn(label: Text('DURATION')),
                            ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('NGO 1')),
                                  DataCell(Text('500INR')),
                                  DataCell(Text("6 months ago")),

                                ]),

                                DataRow(cells: [
                                  DataCell(Text('NGO 1')),
                                  DataCell(Text('500INR')),
                                  DataCell(Text("6 months ago")),

                                ]),

                                DataRow(cells: [
                                  DataCell(Text('NGO 1')),
                                  DataCell(Text('500INR')),
                                  DataCell(Text("6 months ago")),

                                ]),

                                DataRow(cells: [
                                  DataCell(Text('NGO 1')),
                                  DataCell(Text('500INR')),
                                  DataCell(Text("6 months ago")),

                                ]),

                                DataRow(cells: [
                                  DataCell(Text('NGO 1')),
                                  DataCell(Text('500INR')),
                                  DataCell(Text("6 months ago")),

                                ]),

                                DataRow(cells: [
                                  DataCell(Text('NGO 1')),
                                  DataCell(Text('500INR')),
                                  DataCell(Text("6 months ago")),

                                ]),


                              ],

                            ),
                          ),
                        ),

                        Row(
                          children: [

                            FlatButton(
                              onPressed: () => {},
                              color: const Color.fromRGBO(45, 55, 72, 1),
                              padding: EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)
                              ),
                              child: Row( // Replace with a Row for horizontal icon + text
                                children: <Widget>[


                                  Icon(Icons.edit_rounded,
                                    color: Colors.white,
                                  ),
                                  Text("Request Edit",
                                    style: TextStyle(color: Colors.white),

                                  )

                                ],
                              ),
                            ),

                            SizedBox(width:30),


                            FlatButton(
                              onPressed: () => {},
                              color: const Color.fromRGBO(45, 55, 72, 1),
                              padding: EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)
                              ),
                              child: Row( // Replace with a Row for horizontal icon + text
                                children: <Widget>[

                                  Icon(Icons.add,
                                    color: Colors.white,
                                  ),
                                  Text("Add",
                                    style: TextStyle(color: Colors.white),

                                  )

                                ],
                              ),
                            ),
                          ],
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
