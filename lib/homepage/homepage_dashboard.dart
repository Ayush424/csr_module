import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  late List<Days> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 40, left: 40, right: 40),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dashboard',
                style: TextStyle(
                    fontSize: 36, color: Color.fromARGB(255, 42, 67, 101)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(42, 67, 101, 1)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle, color: Colors.white)),
                    Text('Volunteer'),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 3,
            color: Color.fromARGB(255, 237, 242, 247),
          ),
          Row(
            children: [
              Container(
                height: screensize.height * 0.60,
                width: screensize.width * 0.65,
                padding: EdgeInsets.all(20),
                child: SfCartesianChart(
                  legend: Legend(isVisible: true),
                  title: ChartTitle(
                    text: 'Total Volunteering Hours',
                    alignment: ChartAlignment.near,
                  ),
                  tooltipBehavior: _tooltipBehavior,
                  plotAreaBorderColor: Colors.green,
                  series: <ChartSeries>[
                    ColumnSeries<Days, int>(
                      enableTooltip: true,
                      dataSource: _chartData,
                      xValueMapper: (Days day, _) => day.month,
                      yValueMapper: (Days day, _) => day.volunteeringHours,
                    )
                  ],
                  primaryXAxis: CategoryAxis(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Recent Activities',
                style: TextStyle(
                    fontSize: 32, color: Color.fromARGB(255, 42, 67, 101)),
              ),
            ],
          ),
          Divider(
            thickness: 3,
            color: Color.fromARGB(255, 237, 242, 247),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('xyz',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
              Text('updated 3 weeks ago',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Ongoing',
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(44, 82, 130, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Team Members',
                    style: TextStyle(color: Color.fromRGBO(255, 252, 254, 1)),
                  )),
              Text('5 hours',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('xyz',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
              Text('updated 3 weeks ago',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Completed',
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(44, 82, 130, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Team Members',
                    style: TextStyle(color: Color.fromRGBO(255, 252, 254, 1)),
                  )),
              Text('5 hours',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('xyz',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
              Text('updated 3 weeks ago',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Completed',
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(44, 82, 130, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Team Members',
                    style: TextStyle(color: Color.fromRGBO(255, 252, 254, 1)),
                  )),
              Text('5 hours',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('xyz',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
              Text('updated 3 weeks ago',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Completed',
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(44, 82, 130, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Team Members',
                    style: TextStyle(color: Color.fromRGBO(255, 252, 254, 1)),
                  )),
              Text('5 hours',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('xyz',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
              Text('updated 3 weeks ago',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Completed',
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(44, 82, 130, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Team Members',
                    style: TextStyle(color: Color.fromRGBO(255, 252, 254, 1)),
                  )),
              Text('5 hours',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ],
          ),
        ],
      ),
    );
  }
}

List<Days> getChartData() {
  final List<Days> chartData = [
    Days(1, 8),
    Days(2, 10),
    Days(3, 10),
    Days(4, 5),
    Days(5, 18),
    Days(6, 20),
    Days(7, 10),
    Days(8, 16),
    Days(9, 10),
    Days(10, 5),
    Days(11, 7),
    Days(12, 8),
    Days(13, 10),
    Days(14, 9),
    Days(15, 13),
    Days(16, 5),
    Days(17, 10),
    Days(18, 8),
    Days(19, 5),
    Days(20, 10),
    Days(21, 9),
    Days(22, 5),
    Days(23, 10),
    Days(24, 8),
    Days(25, 12),
    Days(26, 10),
    Days(27, 8),
    Days(28, 20),
    Days(29, 6),
    Days(30, 8)
  ];
  return chartData;
}

class Days {
  Days(this.month, this.volunteeringHours);
  final int month;
  final double volunteeringHours;
}
