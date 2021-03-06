import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dashboard_csr_events.dart';
import 'dashboard_ngo_partners.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late DateTime date;

  DateFormat format = DateFormat('MMM, y');
  // bool selected = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    date = DateTime.now();

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ssize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: ListView(
          controller: ScrollController(),
          children: [
            ListTile(
              title: Text(
                'Dashboard',
                style: TextStyle(
                    fontSize: 36, color: Color.fromARGB(255, 42, 67, 101)),
              ),
            ),
            Divider(
              thickness: 3,
              color: Color.fromARGB(255, 237, 242, 247),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                spacing: 5,
                children: [
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
                      child: Icon(
                        Icons.event,
                        color: Color.fromARGB(255, 44, 82, 130),
                        size: 23,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(format.format(date),
                        style: TextStyle(
                          fontSize: 23,
                          color: Color.fromARGB(255, 44, 82, 130),
                        )),
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
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                direction: Axis.horizontal,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side:
                            BorderSide(color: Color.fromRGBO(255, 75, 162, 1))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 70,
                        width: 300,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: CircleAvatar(
                                  maxRadius: 25,
                                  backgroundColor:
                                      Color.fromRGBO(255, 75, 162, 1),
                                  child: Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Flexible(
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                controller: ScrollController(),
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            '    48 ',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 75, 162, 1),
                                                fontSize: 24,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Rubik'),
                                          ),
                                        ),
                                        Flexible(child: MyText(text: 'Hrs')),
                                      ],
                                    ),
                                  ),
                                  MyText(text: 'Total Volunteering Hours'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 10),
                        primary: Colors.white,
                        side:
                            BorderSide(color: Color.fromRGBO(255, 183, 75, 1))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 70,
                        width: 290,
                        child: Row(
                          children: [
                            Flexible(
                              child: CircleAvatar(
                                  maxRadius: 25,
                                  backgroundColor:
                                      Color.fromRGBO(255, 183, 75, 1),
                                  child: Icon(
                                    Icons.attach_money,
                                    color: Colors.white,
                                    size: 50,
                                  )),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Flexible(
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                controller: ScrollController(),
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: Text(
                                            '255.5k ',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 183, 75, 1),
                                                fontSize: 24,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Rubik'),
                                          ),
                                        ),
                                        Flexible(
                                            flex: 1,
                                            child: MyText(text: 'INR')),
                                      ],
                                    ),
                                  ),
                                  MyText(text: 'Payroll Collection'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 10),
                        primary: Colors.white,
                        side:
                            BorderSide(color: Color.fromRGBO(21, 227, 97, 1))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 70,
                        width: 290,
                        child: Row(
                          children: [
                            Flexible(
                              child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      Color.fromRGBO(21, 227, 97, 1),
                                  child: Icon(
                                    Icons.people_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  )),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Flexible(
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                controller: ScrollController(),
                                children: [
                                  Text(
                                    '   209 ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(21, 227, 97, 1),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Rubik'),
                                  ),
                                  MyText(text: 'Beneficiary Count'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                direction: Axis.horizontal,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 10),
                        primary: Colors.white,
                        side:
                            BorderSide(color: Color.fromRGBO(186, 18, 18, 1))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 70,
                        width: 290,
                        child: Row(
                          children: [
                            Flexible(
                              child: CircleAvatar(
                                  maxRadius: 25,
                                  backgroundColor:
                                      Color.fromRGBO(186, 18, 18, 1),
                                  child: Icon(
                                    Icons.payment,
                                    color: Colors.white,
                                    size: 45,
                                  )),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Flexible(
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                controller: ScrollController(),
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            '100k ',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    186, 18, 18, 1),
                                                fontSize: 24,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Rubik'),
                                          ),
                                        ),
                                        Flexible(child: MyText(text: 'INR')),
                                      ],
                                    ),
                                  ),
                                  MyText(text: 'Product Sale Value'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 10),
                        primary: Colors.white,
                        side:
                            BorderSide(color: Color.fromRGBO(44, 82, 130, 1))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 70,
                        width: 300,
                        child: Row(
                          children: [
                            Flexible(
                              child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      Color.fromRGBO(44, 82, 130, 1),
                                  child: Icon(
                                    Icons.how_to_reg,
                                    color: Colors.white,
                                    size: 40,
                                  )),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Flexible(
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                controller: ScrollController(),
                                children: [
                                  Text(
                                    '   209 ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(44, 82, 130, 1),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Rubik'),
                                  ),
                                  MyText(text: 'Employees Benefited'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TabBar(
                      // onTap: (index) {
                      //   setState(() {
                      //     selected = !selected;
                      //   });
                      // },
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 0.1,
                      isScrollable: true,
                      labelColor: Color.fromRGBO(45, 55, 72, 1),
                      labelStyle:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                      unselectedLabelColor: Colors.grey,
                      unselectedLabelStyle:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                      tabs: [
                        Tab(
                          child: Container(
                            height: 50,
                            width: ssize.width > 1000
                                ? ssize.width * 0.15
                                : ssize.width * 0.3,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(235, 248, 255, 1),
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            child: Center(
                                child: Text(
                              'CSR Events',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width > 550
                                          ? 24
                                          : 20),
                            )),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.translationValues(-30, 0, 0),
                          child: Tab(
                            child: Container(
                              height: 50,
                              width: ssize.width > 1000
                                  ? ssize.width * 0.15
                                  : ssize.width * 0.3,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(235, 248, 255, 1),
                                  border:
                                      Border.all(color: Colors.grey.shade300)),
                              child: Center(
                                  child: Text(
                                'NGO Partners',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width > 550
                                            ? 24
                                            : 20),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: 600,
              ),
              child: TabBarView(controller: _tabController, children: <Widget>[
                Column(
                  children: [
                    Flexible(
                      child: CsrEvents(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Flexible(
                      child: NgoPartners(),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class MyText extends StatefulWidget {
  final String text;
  const MyText({Key? key, required this.text}) : super(key: key);

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        fontFamily: 'Rubik',
        color: const Color.fromRGBO(44, 82, 130, 1),
      ),
    );
  }
}
