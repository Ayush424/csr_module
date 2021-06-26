import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'homepage_documents.dart';
import 'package:csr_module/homepage/homepage_training.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.logout_outlined))
        ],
        title: Text('CSR MANAGEMENT'),
        backgroundColor: Colors.blue[900],
        leading: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Material(
            shape: new CircleBorder(),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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


            Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Expanded(
                  child: Row(
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

                           Container(
                             width:300,
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

                        ],
                      ),
                      Column(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                ),
              ),
            ),
          ],
        ),

    );
  }
}


