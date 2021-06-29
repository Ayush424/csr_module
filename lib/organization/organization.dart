import 'package:flutter/material.dart';

class Organization extends StatefulWidget {
  const Organization({Key? key}) : super(key: key);

  @override
  _OrganizationState createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Organization',
              style: TextStyle(
                fontSize: 36,
                color: Color.fromARGB(255, 42, 67, 101),
                decoration: TextDecoration.none,
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 226, 232, 240),
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Core Team',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 44, 82, 130),
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              child: SingleChildScrollView(
                              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label:
                              Text('Name', style: TextStyle(color: Colors.black)),
                        ),
                        DataColumn(
                          label: Text('Department',
                              style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                              )),
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
                            DataCell(Text('abc')),
                            DataCell(Text('xyz')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Volunteers',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 44, 82, 130),
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              child: SingleChildScrollView(
                              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label:
                              Text('Name ', style: TextStyle(color: Colors.black)),
                        ),
                        DataColumn(
                          label: Text('Department',
                              style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                              )),
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
                            DataCell(Text('abc')),
                            DataCell(Text('xyz')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
