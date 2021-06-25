import 'package:flutter/material.dart';
import 'homepage_documents.dart';
import 'package:csr_module/homepage/homepage_training.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:new SingleChildScrollView( scrollDirection: Axis.horizontal, child: SingleChildScrollView( scrollDirection: Axis.vertical,
          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("PROFILE",
                    style: TextStyle(fontSize: 30,
                        fontWeight:FontWeight.bold),
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
                            MaterialPageRoute(builder: (context) => documents()),
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

                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Table(
                        border: TableBorder.all(color: Colors.black),
                        children: [
                          TableRow(children: [
                            Text('Cell 1'),
                            Text('Cell 2'),
                            Text('Cell 3'),
                          ]),
                          TableRow(children: [
                            Text('Cell 4'),
                            Text('Cell 5'),
                            Text('Cell 6'),
                          ])
                        ],
                      ),

                    ],
                  ),
                  Column(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                          'https://source.unsplash.com/50x50/?portrait',
                        ),
                      ),
                      Text("Name"),
                      Text("Department"),

                    ],
                  ),


                ],
              ),
            ],
          ),



        ),
        ),

    );
  }
}


