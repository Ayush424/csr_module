import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  final ValueChanged<String>? update;
  const Calendar({Key? key, this.update}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  final ScrollController _controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: ListView(
          controller: ScrollController(),
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
            SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 12, top: 12),
                        height: 650,
                        child: SfCalendar(
                          backgroundColor: Colors.white70,
                          view: CalendarView.month,
                          appointmentTextStyle: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          headerStyle: CalendarHeaderStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(42, 67, 101, 1),
                                  fontSize: 26)),
                          headerHeight: 50,
                          viewHeaderStyle: ViewHeaderStyle(
                            backgroundColor: Colors.grey[300],
                            dayTextStyle: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(42, 67, 101, 1),
                                fontWeight: FontWeight.w600),
                          ),
                          viewHeaderHeight: 40,
                          showNavigationArrow: true,
                          dataSource: MeetingDataSource(getAppointments()),
                          monthViewSettings: const MonthViewSettings(
                              appointmentDisplayMode:
                                  MonthAppointmentDisplayMode.appointment,
                              dayFormat: 'EEE',
                              monthCellStyle: MonthCellStyle(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, top: 2, bottom: 50),
                        child: SizedBox(
                          height: 90,
                          child: ListView.builder(
                              controller: ScrollController(),
                              itemCount: numItems,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return EventsList(numItems: 3);
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              trailing: TextButton(
                  onPressed: () {
                    widget.update!('Dollar');
                  },
                  child: Text('view more >>>')),
            ),
            SizedBox(
              height: 250,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collectionGroup('Products')
                      .where('likes', isGreaterThan: 0)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Text(
                        'no products to show',
                        style: TextStyle(fontSize: 20, color: lightblue),
                      );
                    } else {
                      return Scrollbar(
                        isAlwaysShown: true,
                        controller: _controllerOne,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ListView.builder(
                              controller: _controllerOne,
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ItemCard(
                                    data: snapshot.data!.docs[index]);
                              }),
                        ),
                      );
                    }
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
  final QueryDocumentSnapshot<Object?> data;
  const ItemCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 400,
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
                SizedBox(
                  height: 70,
                  width: 140,
                  child: Image(
                    image: NetworkImage(
                      data['imgUrl'],
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 230,
                      child: Center(
                        child: Text(
                          data['product name'],
                          maxLines: 2,
                          style: TextStyle(
                              color: Color.fromARGB(255, 45, 55, 72),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '₹' + data['product price'].toString(),
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
              data['description'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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

class EventsList extends StatelessWidget {
  const EventsList({Key? key, required this.numItems}) : super(key: key);
  final int numItems;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 10),
      child: Container(
        height: 20,
        child: Row(
          children: [
            Icon(Icons.crop_square, color: Colors.green),
            SizedBox(
              width: 10,
            ),
            Text('Plantation Drive'),
          ],
        ),
      ),
    );
  }
}
