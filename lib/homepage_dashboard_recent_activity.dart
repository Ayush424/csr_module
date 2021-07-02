import 'package:flutter/material.dart';

class RecentActivity extends StatefulWidget {
  const RecentActivity({Key? key}) : super(key: key);

  @override
  _RecentActivityState createState() => _RecentActivityState();
}

class _RecentActivityState extends State<RecentActivity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('xyz', style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
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
    );
  }
}
