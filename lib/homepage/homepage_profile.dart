import 'package:flutter/material.dart';

class HomeProfile extends StatelessWidget {
  const HomeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 400,
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
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    'https://source.unsplash.com/50x50/?portrait',
                  ),
                ),
                Text(
                  "Name",
                  style: TextStyle(decoration: TextDecoration.none),
                ),
                Text(
                  "Department",
                  style: TextStyle(decoration: TextDecoration.none),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
