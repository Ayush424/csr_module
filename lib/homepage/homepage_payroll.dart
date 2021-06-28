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
          Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all((30)),
                  child: Container(
                    width: 300,
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
                Row(
                  children: [
                    FlatButton(
                      onPressed: () => {},
                      color: const Color.fromRGBO(45, 55, 72, 1),
                      padding: EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      child: Row(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(
                            Icons.edit_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            "Request Edit",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    FlatButton(
                      onPressed: () => {},
                      color: const Color.fromRGBO(45, 55, 72, 1),
                      padding: EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      child: Row(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text(
                            "Add",
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
    );
  }
}
