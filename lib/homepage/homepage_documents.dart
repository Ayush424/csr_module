import 'package:flutter/material.dart';

class HomeDocuments extends StatefulWidget {
  const HomeDocuments({Key? key}) : super(key: key);

  @override
  _HomeDocumentsState createState() => _HomeDocumentsState();
}

class _HomeDocumentsState extends State<HomeDocuments> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.all((30)),
            child: Container(
              width: 600,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('DOCUMENT')),
                  DataColumn(label: Text('TYPE')),
                  DataColumn(label: Text('ACTION')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('doc')),
                    DataCell(Icon(Icons.delete)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text("pdf")),
                    DataCell(Icon(Icons.delete)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text('pdf')),
                    DataCell(Icon(Icons.delete)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3')),
                    DataCell(Text('img')),
                    DataCell(Icon(Icons.delete)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('4')),
                    DataCell(Text("img")),
                    DataCell(Icon(Icons.delete)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('5')),
                    DataCell(Text('pdf')),
                    DataCell(Icon(Icons.delete)),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
