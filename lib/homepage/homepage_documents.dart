import 'package:flutter/material.dart';

class HomeDocuments extends StatefulWidget {
  const HomeDocuments({Key? key}) : super(key: key);

  @override
  _HomeDocumentsState createState() => _HomeDocumentsState();
}

class _HomeDocumentsState extends State<HomeDocuments> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Wrap(
            children: [
              Column(
                children: [
                  Container(
                    width: 780,
                    height: 180,
                    decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 237, 242, 247),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            label: Text('Upload'),
                            icon: Icon(Icons.upload_sharp),
                            style: ButtonStyle(
                              fixedSize:
                                  MaterialStateProperty.all(Size(150, 40)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Drag and Drop here",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Uploaded Documents",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 42, 67, 101),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all((10)),
                    child: Container(
                      width: 780,
                      decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 237, 242, 247),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
