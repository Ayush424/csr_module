import 'package:flutter/material.dart';

class HomeTrainings extends StatefulWidget {
  const HomeTrainings({Key? key}) : super(key: key);

  @override
  _HomeTrainingsState createState() => _HomeTrainingsState();
}

class _HomeTrainingsState extends State<HomeTrainings> {
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Trainings',
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
                        label:
                            Text('Name', style: TextStyle(color: Colors.black)),
                      ),
                      DataColumn(
                        label: Text('Duration',
                            style: TextStyle(
                              color: Color.fromARGB(255, 44, 82, 130),
                            )),
                      ),
                      DataColumn(
                        label: Text('Starting On',
                            style: TextStyle(
                              color: Color.fromARGB(255, 44, 82, 130),
                            )),
                      ),
                      DataColumn(
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Text('Action',
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
                          DataCell(Text('abc')),
                          DataCell(Text('xyz')),
                          DataCell(Text('xyz')),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.read_more,
                                  size: 24.0,
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(45, 55, 72, 1)),
                                ),
                                label: Text('Apply'),
                                onPressed: () {
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
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
            'Registered & Completed',
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
                        label: Text('Name ',
                            style: TextStyle(color: Colors.black)),
                      ),
                      DataColumn(
                        label: Text('Duration',
                            style: TextStyle(
                              color: Color.fromARGB(255, 44, 82, 130),
                            )),
                      ),
                      DataColumn(
                        label: Text('Starting On',
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
    );
  }
}
