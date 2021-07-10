import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class HomeProfile extends StatelessWidget {
  final AuthService _authService = AuthService();
  final collection = FirebaseFirestore.instance.collection("Users");

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context, String details) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter" + details),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter"),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: SizedBox(
        width: 900,
        child: Wrap(
          spacing: 90,
          runSpacing: 90,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Wrap(
                children: [
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Color.fromARGB(255, 204, 204, 204),
                      width: 1,
                    )),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: 800,
                        child: DataTable(columns: const <DataColumn>[
                          DataColumn(
                            label: Text('Fields',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                )),
                          ),
                          DataColumn(
                            label: Text('Entry',
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
                        ], rows: [
                          DataRow(cells: [
                            DataCell(Text('Name')),
                            DataCell(Text('Mayank')),
                            DataCell(Text(" ")),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Emp_Code')),
                            DataCell(Text('CA2021')),
                            DataCell(Text(" ")),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Email')),
                            DataCell(Text('mayank@gmail.com')),
                            DataCell(Text(" ")),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Date of Joining')),
                            DataCell(Text('15-06-2021')),
                            DataCell(Text("")),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Phone Number')),
                            DataCell(Text('1234567891')),
                            DataCell(
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                ),
                                onPressed: () {
                                  _displayDialog(context, " new Phone Number");
                                },
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('skype_id')),
                            DataCell(Text('mayank15')),
                            DataCell(
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                ),
                                onPressed: () {
                                  _displayDialog(context, "new Skype_Id");
                                },
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Department')),
                            DataCell(Text('Management')),
                            DataCell(Text("")),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Gender')),
                            DataCell(Text('Male')),
                            DataCell(
                              Text(""),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Home_Address')),
                            DataCell(Text('Madhya Pradesh')),
                            DataCell(
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                ),
                                onPressed: () {
                                  _displayDialog(context, " new Home Address");
                                },
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Current_Address')),
                            DataCell(Text('Madhya Pradesh')),
                            DataCell(
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                ),
                                onPressed: () {
                                  _displayDialog(
                                      context, " new Current Address");
                                },
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Marital Status')),
                            DataCell(Text('Married')),
                            DataCell(
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                ),
                                onPressed: () {
                                  _displayDialog(context, "Marital Status");
                                },
                              ),
                            ),
                          ]),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/104113705/original/6076831db34315e45bd2a31a9d79bb7b91d48e04/design-flat-style-minimalist-avatar-of-you.jpg',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Name",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Department",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
