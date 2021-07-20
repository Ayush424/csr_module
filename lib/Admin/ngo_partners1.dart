import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:intl/intl.dart';

class NgoPartner extends StatefulWidget {
  const NgoPartner({Key? key}) : super(key: key);

  @override
  _NgoPartnerState createState() => _NgoPartnerState();
}

class _NgoPartnerState extends State<NgoPartner> {
  Map<String, double> dataMap = {
    "NGO’s Whose MoU period is running": 70,
    "NGO’s whose MoU is ending this month": 30,
  };
  static const int numItems = 4;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  bool add = false;
  late DateTime date;

  DateFormat format = DateFormat('MMM, y');
  @override
  void initState() {
    date = DateTime.now();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Analytics - NGO Partners',
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
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Wrap(
                    children: [
                      PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing:
                            MediaQuery.of(context).size.width >= 990 ? 100 : 50,
                        // chartRadius: MediaQuery.of(context).size.width / 6,
                        // colorList: colorList,
                        chartRadius: 180,
                        initialAngleInDegree: 0,
                        // ringStrokeWidth: 10,
                        // centerText: "HYBRID",
                        legendOptions: LegendOptions(
                          showLegendsInRow: false,
                          legendPosition:
                              MediaQuery.of(context).size.width >= 990
                                  ? LegendPosition.right
                                  : LegendPosition.bottom,
                          showLegends: true,
                          legendTextStyle: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            color: Color.fromARGB(255, 42, 67, 101),
                          ),
                        ),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: false,
                          showChartValuesInPercentage: false,
                          showChartValuesOutside: false,
                          decimalPlaces: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  width: 1200,
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
                        columnSpacing: 231,
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'NGO Name',
                              style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text('Category',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                )),
                          ),
                          DataColumn(
                            label: Text('MoU Start Date',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                )),
                          ),
                          DataColumn(
                            label: Text('MoU End Date',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 82, 130),
                                )),
                          ),
                          DataColumn(
                            label: Text('View More',
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
                              return Color.fromARGB(255, 237, 242, 247);
                            }),
                            cells: <DataCell>[
                              DataCell(Text('abc')),
                              DataCell(Text('xyz')),
                              DataCell(Text('abc')),
                              DataCell(Text('abc')),
                              DataCell(ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 45, 55, 72),
                                ),
                                child: Text(
                                  'View more',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.add,
                      size: 24.0,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(45, 55, 72, 1)),
                    ),
                    label: Text('Add New'),
                    onPressed: () {
                      Form();
                    },
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

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 237, 242, 247)),
        child: Wrap(
          spacing: 200,
          runSpacing: 20,
          children: [
            Column(
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 67, 101),
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                    controller: textController,
                    decoration: InputDecoration(hintText: 'Enter Name')),
              ],
            ),
            Column(
              children: [
                Text(
                  'Contact person',
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 67, 101),
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                    controller: textController,
                    decoration: InputDecoration(hintText: 'Enter Name')),
              ],
            ),
            Column(
              children: [
                Text(
                  'Category',
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 67, 101),
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                    controller: textController,
                    decoration: InputDecoration(hintText: 'Enter Name')),
              ],
            ),
            Column(
              children: [
                Text(
                  'Contact number',
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 67, 101),
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                    controller: textController,
                    decoration: InputDecoration(hintText: 'Enter contat no.')),
              ],
            ),
            Column(
              children: [
                Text(
                  'MoU Start Date',
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 67, 101),
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                    controller: textController,
                    decoration: InputDecoration(hintText: 'Enter Name')),
              ],
            )
          ],
        ));
  }
}
