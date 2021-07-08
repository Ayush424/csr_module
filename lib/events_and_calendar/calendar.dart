import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'Events and Calendar',
                style: TextStyle(
                    fontSize: 36, color: Color.fromARGB(255, 42, 67, 101)),
              ),
            ),
            Divider(
              thickness: 3,
              color: Color.fromARGB(255, 237, 242, 247),
            ),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        height: 600,
                        child: SfCalendar(
                          view: CalendarView.month,
                          headerStyle: CalendarHeaderStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(42, 67, 101, 1),
                                  fontSize: 28)),
                          viewHeaderStyle: ViewHeaderStyle(
                            backgroundColor: Colors.grey[300],
                            dayTextStyle: TextStyle(
                                fontSize: 28,
                                color: Color.fromRGBO(42, 67, 101, 1),
                                fontWeight: FontWeight.w700),
                          ),
                          viewHeaderHeight: 30,
                          showNavigationArrow: true,
                          dataSource: MeetingDataSource(getAppointments()),
                          monthViewSettings: const MonthViewSettings(
                            appointmentDisplayMode:
                                MonthAppointmentDisplayMode.appointment,
                          ),
                          appointmentTextStyle: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        ListView(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: [
                            ListTile(
                              leading:
                                  Icon(Icons.crop_square, color: Colors.green),
                              title: Text('Plantation Drive'),
                            ),
                            ListTile(
                              leading:
                                  Icon(Icons.crop_square, color: Colors.red),
                              title: Text('Village Visit'),
                            ),
                            ListTile(
                              leading: Icon(Icons.crop_square,
                                  color: Colors.deepPurple),
                              title: Text('Yoga Event'),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 210,
              child: ListView.builder(
                  itemCount: numItems,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ItemCard();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  DateTime today = DateTime.now();
  DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
  DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
    subject: 'Plantation Drive',
    startTime: startTime.add(Duration(days: 6)),
    endTime: endTime.add(Duration(days: 6)),
    color: Colors.green,
  ));

  meetings.add(Appointment(
    subject: 'Village Visit',
    startTime: startTime,
    endTime: endTime,
    color: Colors.red,
  ));
  meetings.add(Appointment(
    subject: 'Yoga Event',
    startTime: startTime.add(Duration(days: -5)),
    endTime: endTime.add(Duration(days: -5)),
    color: Colors.deepPurple,
  ));

  return meetings;
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 340,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        border: Border.all(color: Color.fromARGB(255, 204, 204, 204), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'product.jpeg',
                  width: 121,
                  height: 81,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      'Product Name',
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 55, 72),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$4.99',
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 55, 72),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Comp. shares: 30%',
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 113, 128, 150)),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Buys: 2000 units',
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 113, 128, 150)),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Product Description lorem ipsum',
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 113, 128, 150)),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'NGO/by : Name of Organisation',
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 113, 128, 150)),
            )
          ],
        ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
