import 'package:flutter/material.dart';
import 'homepage_profile.dart';
import 'homepage_documents.dart';

class training extends StatefulWidget {
  const training({Key? key}) : super(key: key);

  @override
  _trainingState createState() => _trainingState();
}

class _trainingState extends State<training> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSR MANAGEMENT'),
        backgroundColor: const Color.fromRGBO(45, 55, 72, 1),
        leading: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Material(
            shape: new CircleBorder(),
          ),
        ),
      ),
      body:new
      SingleChildScrollView( scrollDirection: Axis.horizontal, child: SingleChildScrollView( scrollDirection: Axis.vertical,
        child:Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "DOCUMENTS",
                        style: TextStyle(fontSize: 30,
                            fontWeight:FontWeight.bold),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 15,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
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
                            MaterialPageRoute(builder: (context) => documents()),
                          );
                        },
                      ),
                      SizedBox(height: 5),
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
                ),
                SizedBox(height: 50),

                Container(

                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 150),
                      Container(child: Row(
                        children: [
                          Container(
                            child: Column(
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
                                SizedBox(height: 20),
                                Text("Drag and Drop files to upload"),
                              ],
                            ),
                          ),


                        ],
                      ),
                      ),
                      SizedBox(height: 100),

                    ],
                  ),
                ),
              ],
            )





          // floatingActionButton: FloatingActionButton.extended(
          //        onPressed: _addRow,
          //        label: Text('Add Row'),
          //        backgroundColor: Colors.green,
          //      ),
          // child: Table(
          //   border: TableBorder.all(color: Colors.black),
          //   children: [
          //     TableRow(children: [
          //       Text('Cell 1'),
          //       Text('Cell 2'),
          //       Text('Cell 3'),
          //       Text('Cell 3'),
          //     ]),
          //     TableRow(children: [
          //       Text('Cell 4'),
          //       Text('Cell 5'),
          //       Text('Cell 6'),
          //       Text('Cell 4'),
          //     ])
          //
          //   ],
          // ),
        ),
      ),
      ),
    );
  }
}
