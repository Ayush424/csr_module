import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'homepage_documents.dart';
import 'package:csr_module/homepage/homepage_training.dart';
import 'homepage_payroll.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<profile> {

  final AuthService _auth = AuthService();
  @override
//row data


  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: const Icon(Icons.logout_outlined))
          ],
          title: const Text('CSR MANAGEMENT'),
          backgroundColor: Colors.blue[900],
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Material(
              shape: CircleBorder(),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Wrap(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "MY HOME",
                    style:TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          FlatButton(
                            minWidth: 100,
                            color: Color.fromRGBO(229, 229, 229,1),
                            child: Text(
                              "Profile"
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => profile()),
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
                                MaterialPageRoute(
                                    builder: (context) => documents()),
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
                                MaterialPageRoute(
                                    builder: (context) => training()),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 400,
                            child: DataTable( columns: [
                              DataColumn(label: Text('FIELDS')),
                              DataColumn(label: Text('ENTRY')),
                              DataColumn(label: Text('ACTION')),
                            ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('Name')),
                                  DataCell(Text('Mradima')),
                                  DataCell(Icon(Icons.edit)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Emp_Code')),
                                  DataCell(Text('18U02080')),
                                  DataCell(Icon(Icons.edit)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Email')),
                                  DataCell(Text('mradima@gmail.com')),
                                  DataCell(Icon(Icons.edit)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Phone No.')),
                                  DataCell(Text('1234567891')),
                                  DataCell(Icon(Icons.edit)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Date of Joining')),
                                  DataCell(Text('01-3-2021')),
                                  DataCell(Icon(Icons.edit)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Skype id')),
                                  DataCell(Text('Skype@id')),
                                  DataCell(Icon(Icons.edit)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Department')),
                                  DataCell(Text('CSE')),
                                  DataCell(Icon(Icons.edit)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Gender')),
                                  DataCell(Text('Female')),
                                  DataCell(Icon(Icons.edit)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Home Address')),
                                  DataCell(Text('Gwalior')),
                                  DataCell(Icon(Icons.edit)),

                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Current Address')),
                                  DataCell(Text('Gwalior')),
                                  DataCell(Icon(Icons.edit)),

                                ]),

                              ],

                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ],
          ),
        ));
  }
}

