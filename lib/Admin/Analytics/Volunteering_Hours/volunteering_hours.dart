import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:intl/intl.dart';

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
    date = DateTime.now();

    super.initState();

    myController.addListener(() {
      setState(() {
        _searchText = myController.text;
      });
    });
  }
  TextEditingController _textFieldController = TextEditingController();
_displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter Hours'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Hours"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text('Edit'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(45, 55, 72, 1)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  String dropdownValue = 'Select Event';
  bool select = false;
  static const int numItems = 4;
  int hours = 00;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  late DateTime date;

  DateFormat format = DateFormat('MMM, y');

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
                Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    spacing: 15,
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              date = DateTime(date.year, date.month - 1, 15);
                            });
                          },
                          icon: Icon(
                            Icons.arrow_left,
                            size: 30,
                            color: Color.fromARGB(255, 44, 82, 130),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(
                            Icons.event,
                            color: Color.fromARGB(255, 44, 82, 130),
                            size: 23,
                          )),
                          TextSpan(
                              text: format.format(date),
                              style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 44, 82, 130),
                              ))
                        ])),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              date = DateTime(date.year, date.month + 1, 15);
                            });
                          },
                          icon: Icon(
                            Icons.arrow_right,
                            size: 30,
                            color: Color.fromARGB(255, 44, 82, 130),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: PieChart(
                    dataMap: dataMap,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing:
                                    MediaQuery.of(context).size.width >= 990
                                        ? 180
                                        : 50,
                    chartRadius: 190,
                    initialAngleInDegree: 0,
                    // ringStrokeWidth: 10,
                    // centerText: "HYBRID",
                    legendOptions: LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: MediaQuery.of(context).size.width >= 990
                                          ? LegendPosition.right
                                          : LegendPosition.bottom,
                      showLegends: true,
                      legendTextStyle: TextStyle(
                        fontSize: 24,
                        decoration: TextDecoration.none,
                        color: Color.fromARGB(255, 42, 67, 101),
                      ),
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: false,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: false,
                      decimalPlaces: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Wrap(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 280,
                    runSpacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButton(
                          focusColor: Color.fromARGB(255, 113, 128, 150),
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              select = true;
                            });
                          },
                          items: <String>["Select Event", '1', '2', '3', '4']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(
                                  widthFactor: 1.5,
                                  heightFactor: 0.5,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(value))),
                            );
                          }).toList(),
                        ),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Container(
                            width: 200,
                            height: 39,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextField(
                              controller: myController,
                              decoration: InputDecoration(
                                // labelText: "Search",
                                hintText: "Search employee",
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 113, 128, 150))),
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 204, 204, 204),
                                ),
                                focusColor: Color.fromARGB(255, 204, 204, 204),
                                fillColor: Color.fromARGB(255, 204, 204, 204),
                                suffixIcon: _searchText.isNotEmpty
                                    ? IconButton(
                                        icon: Icon(
                                          Icons.clear,
                                          color: Color.fromARGB(
                                              255, 113, 128, 150),
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
                                              255, 113, 128, 150),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            Color.fromARGB(255, 113, 128, 150);
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
                Divider(
                  color: Color.fromARGB(255, 226, 232, 240),
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                dropdownValue == "Select Event"
                    ? Container()
                    : Container(
                        height: 200,
                        width: 1150,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Color.fromARGB(255, 204, 204, 204),
                          width: 1,
                        )),
                        child: SingleChildScrollView(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: ScrollController(),
                            child: DataTable(
                              columnSpacing: 215,
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Text('Emp code',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Name',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Department',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Date',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Hours',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                numItems,
                                (int index) => DataRow(
                                  color:
                                      MaterialStateProperty.resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
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
                                    DataCell(Text('abc')),
                                    DataCell(Text('abc')),
                                    DataCell(Row(
                                          
                                          children: [
                                            Text('1'),
                                            IconButton(
                                              icon: Icon(
                                                Icons.drive_file_rename_outline,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                _displayDialog(context);
                                              },
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
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
