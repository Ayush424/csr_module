import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  @override
  Widget build(BuildContext context) {
    //  var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      constraints: BoxConstraints.expand(),
      child: Padding(
        padding: EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Activity',
                style: TextStyle(
                    color: Color.fromARGB(255, 42, 67, 101),
                    fontSize: 36,
                    decoration: TextDecoration.none),
              ),
              Divider(
                color: Color.fromARGB(255, 226, 232, 240),
                thickness: 2,
              ),
              SizedBox(height: 20),
              Text(
                'Permitted Activties',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 44, 82, 130),
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 20,
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
                            label: Text('Name',
                                style: TextStyle(color: Colors.black)),
                          ),
                          DataColumn(
                            label: Text('Description',
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
                height: 50,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Text(
                            'Company Initiated Activities',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 44, 82, 130),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            // width: 650,
                            height: 200,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color.fromARGB(255, 204, 204, 204),
                              width: 1,
                            )),
                            child: SingleChildScrollView(
                              child: DataTable(
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text('Name',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  numItems,
                                  (int index) => DataRow(
                                    color: MaterialStateProperty.resolveWith<
                                        Color?>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return Color.fromARGB(
                                                255, 237, 242, 247)
                                            .withOpacity(0.08);
                                      }
                                      if (index.isEven) {
                                        return Color.fromARGB(
                                            255, 237, 242, 247);
                                      }
                                      return null;
                                    }),
                                    cells: <DataCell>[
                                      DataCell(Text('abc')),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Text(
                            'Goverment Initiated Activities',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 44, 82, 130),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color.fromARGB(255, 204, 204, 204),
                              width: 1,
                            )),
                            // width: 650,
                            child: SingleChildScrollView(
                              child: DataTable(
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text('Name',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  numItems,
                                  (int index) => DataRow(
                                    color: MaterialStateProperty.resolveWith<
                                        Color?>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return Color.fromARGB(
                                                255, 237, 242, 247)
                                            .withOpacity(0.08);
                                      }
                                      if (index.isEven) {
                                        return Color.fromARGB(
                                            255, 237, 242, 247);
                                      }
                                      return null;
                                    }),
                                    cells: <DataCell>[
                                      DataCell(Text('abc')),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
