import 'package:flutter/material.dart';

class Intermediate extends StatefulWidget {
  Intermediate({Key? key}) : super(key: key);

  @override
  _IntermediateState createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> {
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Color.fromARGB(255, 204, 204, 204),
        width: 1,
      )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Emp',
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 82, 130),
                      )),
                ),
                DataColumn(
                  label: Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Text('Name',
                        style: TextStyle(
                          color: Color.fromARGB(255, 44, 82, 130),
                        )),
                  ),
                ),
                DataColumn(
                  label: Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Text('Department',
                        style: TextStyle(
                          color: Color.fromARGB(255, 44, 82, 130),
                        )),
                  ),
                ),
              ],
              rows: List<DataRow>.generate(
                numItems,
                (int index) => DataRow(
                  color: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Color.fromARGB(255, 237, 242, 247)
                          .withOpacity(0.08);
                    }
                    if (index.isEven) {
                      return Color.fromARGB(255, 237, 242, 247);
                    }
                    return null;
                  }),
                  cells: <DataCell>[
                    DataCell(Text('Emp')),
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text("Name"),
                      ),
                    ),
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text("Department"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
