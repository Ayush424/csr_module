import 'package:flutter/material.dart';

class HomePayroll extends StatefulWidget {
  const HomePayroll({Key? key}) : super(key: key);

  @override
  _HomePayrollState createState() => _HomePayrollState();
}

class _HomePayrollState extends State<HomePayroll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all((30)),
                    child: Container(
                      width: 400,
                      child: DataTable(
                        columns: [
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
                  Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.edit,
                          size: 24.0,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(45, 55, 72, 1)),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                        ),
                        label: Text('Request Edit'),
                        onPressed: () {},
                      ),
                      SizedBox(width: 30),
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.add,
                          size: 24.0,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(45, 55, 72, 1)),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                        ),
                        label: Text('Add'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0,
                    children: [
                      Row(
                        children: [],
                      ),
                    ],
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
