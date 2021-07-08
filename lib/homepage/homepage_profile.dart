import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class HomeProfile extends StatelessWidget {
  final AuthService _authService = AuthService();
  final collection = FirebaseFirestore.instance.collection("Users");
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Wrap(
          spacing: 200,
          runSpacing: 100,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
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
                      child: Wrap(
                        children: [
                          DataTable(columns: const <DataColumn>[
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
                              DataCell(Icon(Icons.edit)),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('skype_id')),
                              DataCell(Text('mayank15')),
                              DataCell(Icon(Icons.edit)),
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
                                Icon(Icons.edit),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Current_Address')),
                              DataCell(Text('Madhya Pradesh')),
                              DataCell(
                                Icon(Icons.edit),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Marital Status')),
                              DataCell(Text('Married')),
                              DataCell(
                                Icon(Icons.edit),
                              ),
                            ]),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
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
          ],
        ),
      ),
    );
  }
}
