import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class VolunteeringHours extends StatefulWidget {
  const VolunteeringHours({Key? key}) : super(key: key);

  @override
  _VolunteeringHoursState createState() => _VolunteeringHoursState();
}

class _VolunteeringHoursState extends State<VolunteeringHours> {
  Map<String, double> dataMap = {
    "Event 1": 48,
    "Event 2": 38,
    "Event 3": 16,
    "Event 4": 34,
    "Event 5": 30,
  };
  String _searchText = "";
  final myController = TextEditingController();
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();

    myController.addListener(() {
      setState(() {
        _searchText = myController.text;
      });
    });
  }

  String dropdownValue = 'Select Event';
  bool select = false;
  static const int numItems = 4;
  int hours = 00;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Analytics - Volunteering Hours',
                  style: TextStyle(
                      color: Color.fromARGB(255, 42, 67, 101),
                      fontSize: 36,
                      decoration: TextDecoration.none),
                ),
                Divider(
                  color: Color.fromARGB(255, 226, 232, 240),
                  thickness: 2,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing: 32,
                        // chartRadius: MediaQuery.of(context).size.width / 6,
                        // colorList: colorList,
                        chartRadius: 180,
                        initialAngleInDegree: 0,
                        // ringStrokeWidth: 10,
                        // centerText: "HYBRID",
                        legendOptions: LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: LegendPosition.right,
                          showLegends: true,
                          legendTextStyle: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            color: Color.fromARGB(255, 42, 67, 101),
                          ),
                        ),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          showChartValuesInPercentage: false,
                          showChartValuesOutside: false,
                          decimalPlaces: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(
                      255,
                      237,
                      242,
                      247,
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: 30,
                            // width: 200,
                            decoration: BoxDecoration(color: Colors.white),
                            child: DropdownButton(
                              focusColor: Color.fromARGB(255, 113, 128, 150),
                              value: dropdownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                  select = true;
                                });
                              },
                              items: <String>[
                                "Select Event",
                                '1',
                                '2',
                                '3',
                                '4'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Container(
                              width: 200,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextField(
                                controller: myController,
                                decoration: InputDecoration(
                                  // labelText: "Search",
                                  hintText: "Search",
                                  focusColor:
                                      Color.fromARGB(255, 204, 204, 204),
                                  fillColor: Color.fromARGB(255, 204, 204, 204),
                                  suffixIcon: _searchText.isNotEmpty
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.clear,
                                            color: Color.fromARGB(
                                                255, 204, 204, 204),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              myController.clear();
                                            });
                                          },
                                        )
                                      : IconButton(
                                          icon: Icon(
                                            Icons.search,
                                            color: Color.fromARGB(
                                                255, 204, 204, 204),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              Color.fromARGB(
                                                  255, 204, 204, 204);
                                              // myController.search();
                                            });
                                          },
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'Total: ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 42, 67, 101),
                                      fontSize: 24,
                                      decoration: TextDecoration.none),
                                ),
                                TextSpan(
                                  text: '$hours',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 42, 67, 101),
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                                WidgetSpan(
                                    child: Transform.translate(
                                  offset: const Offset(4, 2),
                                  child: Text(
                                    'hrs',
                                    textScaleFactor: 0.9,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 42, 67, 101),
                                        fontSize: 28),
                                  ),
                                ))
                              ]),
                            ),
                          ),
                        )
                      ]),
                ),
                dropdownValue == "Select Event"
                    ? Container()
                    : Container(
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
                                    label: Text('Emp code',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                  DataColumn(
                                    label: Text('Name',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Department',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Date',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('hrs',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                        )),
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
                                      DataCell(Text('xyz')),
                                      DataCell(Text('abc')),
                                      DataCell(Text('abc')),
                                      DataCell(Text('4')),
                                    ],
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
      ),
    );
  }
}
