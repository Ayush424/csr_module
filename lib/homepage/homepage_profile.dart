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
          spacing: 400,
          runSpacing: 100,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Wrap(
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 100,
                    child: DataTable(
                      columns: [
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
                        DataRow(cells: [
                          DataCell(Text('Current Address')),
                          DataCell(Text('Gwalior')),
                          DataCell(Icon(Icons.edit)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Current Address')),
                          DataCell(Text('Gwalior')),
                          DataCell(Icon(Icons.edit)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Current Address')),
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
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
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
