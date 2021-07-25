import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:csr_module/Admin/admin_page_struct/admin_page_struct.dart';
import 'package:csr_module/User/activity/activity.dart';
import 'package:csr_module/User/assistance/assistance_give.dart';
import 'package:csr_module/User/assistance/assistance_need.dart';
import 'package:csr_module/User/dashboard/dashboard.dart';
import 'package:csr_module/User/dollarFordollar/productdetails.dart';
import 'package:csr_module/User/events_and_calendar/calendar.dart';
import 'package:csr_module/User/organization/dollar_for_dollar.dart';
import 'package:csr_module/User/organization/organization.dart';
import 'package:csr_module/User/organization/registration.dart';

import '../homepage/static_homepage.dart';

import 'static_mainpage.dart';

import 'package:flutter/material.dart';

import 'package:csr_module/auth/services/firebase_auth_service.dart';

import '../homepage/homepage_structure.dart';

class MainPageStructDesktop extends StatefulWidget {
  final ValueChanged<String>? update;
  final String role;
  const MainPageStructDesktop({Key? key, required this.role, this.update})
      : super(key: key);

  @override
  _MainPageStructDesktopState createState() => _MainPageStructDesktopState();
}

class _MainPageStructDesktopState extends State<MainPageStructDesktop> {
  // String GlobalMainPage.mainpage = "dashboard";
  void _update(String mainpage) {
    setState(() {
      GlobalHomePage.homepage = "setgoals";
      GlobalMainPage.mainpage = mainpage;
    });
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        width: 350,
        height: 100,
        color: Color.fromARGB(255, 45, 55, 72),
        margin: EdgeInsets.only(bottom: 430),
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(_auth.returnCurrentUserid())
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              }
              return DrawerHeader(
                child: Wrap(
                  children: [
                    SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.network(snapshot.data!['imgUrl'])),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!['displayName'],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          snapshot.data!['department'],
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          snapshot.data!['empcode'],
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          snapshot.data!['email'],
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            await _auth.signOut();
                          },
                          tooltip: 'Logout',
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
      appBar: AppBar(
        actions: [
          Transform(
            transform: Matrix4.translationValues(-20, 0, 0),
            child: IconButton(
              tooltip: 'Notification',
              onPressed: () {},
              icon: const Icon(Icons.notifications_active,
                  color: Colors.white, size: 30),
            ),
          ),
          Builder(
            builder: (context) => Transform(
              transform: Matrix4.translationValues(-20, 0, 0),
              child: IconButton(
                tooltip: 'User',
                icon: const Icon(Icons.account_circle,
                    color: Colors.white, size: 50),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.air_rounded),
          onPressed: () {},
        ),
        title: const Text(
          "CSR Management",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 45, 55, 72),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: const Color.fromARGB(255, 237, 242, 247),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
                children: [
                  widget.role == "admin"
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Wrap(
                              runSpacing: 10,
                              spacing: 20,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    widget.update!("user");
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(45, 55, 72, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                  child: Text(
                                    "Main Panel",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    widget.update!("admin");
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(255, 75, 162, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                  child: Text(
                                    "Control Panel",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  ListTile(
                    leading: const MyIcon(icon: Icons.assessment_outlined),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "Dashboard",
                        bold: (GlobalMainPage.mainpage == 'dashboard'),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        GlobalMainPage.mainpage = 'dashboard';
                      });
                    },
                  ),
                  ListTile(
                    leading: const MyIcon(icon: Icons.home_outlined),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "My Home",
                        bold: (GlobalMainPage.mainpage == 'myhome'),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        GlobalMainPage.mainpage = 'myhome';
                      });
                    },
                  ),
                  ExpansionTile(
                    childrenPadding: const EdgeInsets.only(
                      left: 40,
                    ),
                    leading: MyIcon(icon: Icons.help_outline),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "Assistance",
                        bold: (GlobalMainPage.mainpage == 'assistance'),
                      ),
                    ),
                    trailing: const MyIcon(icon: Icons.arrow_right),
                    children: [
                      ListTile(
                        title: MyText(
                          text: "I Can",
                          bold: (GlobalMainPage.mainpage == 'cangive'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalMainPage.mainpage = 'cangive';
                          });
                        },
                      ),
                      ListTile(
                        title: MyText(
                          text: "I Need",
                          bold: (GlobalMainPage.mainpage == 'ineed'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalMainPage.mainpage = "ineed";
                          });
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    childrenPadding: const EdgeInsets.only(left: 40),
                    leading: MyIcon(icon: Icons.people_outline_outlined),
                    trailing: MyIcon(icon: Icons.arrow_right),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "CSR Cell",
                        bold: (GlobalMainPage.mainpage == 'csrcell'),
                      ),
                    ),
                    children: [
                      ListTile(
                        title: MyText(
                          text: "Core Team",
                          bold: (GlobalMainPage.mainpage == 'coreteam'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalMainPage.mainpage = 'coreteam';
                          });
                        },
                      ),
                      ListTile(
                        title: MyText(
                          text: "Registration Form",
                          bold: (GlobalMainPage.mainpage == 'registrationform'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalMainPage.mainpage = 'registrationform';
                          });
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    leading: MyIcon(icon: Icons.calendar_today_rounded),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "Events and Calendar",
                        bold: (GlobalMainPage.mainpage == 'calendar'),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        GlobalMainPage.mainpage = 'calendar';
                      });
                    },
                  ),
                  ListTile(
                    leading: const MyIcon(icon: Icons.extension),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "Activity",
                        bold: (GlobalMainPage.mainpage == 'activity'),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        GlobalMainPage.mainpage = 'activity';
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Builder(builder: (context) {
              if (GlobalMainPage.mainpage == 'cangive') {
                return AssistanceCanGive();
              } else if (GlobalMainPage.mainpage == 'details') {
                return ProductDetails();
              } else if (GlobalMainPage.mainpage == 'ineed') {
                return AssistanceNeed();
              } else if (GlobalMainPage.mainpage == 'coreteam') {
                return Organization();
              } else if (GlobalMainPage.mainpage == 'myhome') {
                return HomePageStruct();
              } else if (GlobalMainPage.mainpage == 'activity') {
                return Activity();
              } else if (GlobalMainPage.mainpage == 'registrationform') {
                return RegistrationForm();
              } else if (GlobalMainPage.mainpage == 'dashboard') {
                return HomeDashboard(
                  update: _update,
                );
              } else if (GlobalMainPage.mainpage == 'calendar') {
                return Calendar(
                  update: _update,
                );
              } else if (GlobalMainPage.mainpage == 'Dollar') {
                return DollarForDollar();
              } else {
                return Container();
              }
            }),
          ),
        ],
      ),
    );
  }
}

class MyText extends StatefulWidget {
  final bool bold;
  final String text;
  const MyText({Key? key, required this.text, required this.bold})
      : super(key: key);

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.clip,
      softWrap: false,
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          color: const Color.fromARGB(255, 44, 82, 130),
          fontWeight: widget.bold ? FontWeight.w800 : null,
          decoration: hover ? TextDecoration.underline : null,
        ),
        text: widget.text,
        mouseCursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() {
          hover = true;
        }),
        onExit: (event) => setState(() {
          hover = false;
        }),
      ),
    );
  }
}

class MyIcon extends StatelessWidget {
  final IconData icon;
  const MyIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: const Color.fromARGB(255, 44, 82, 130),
      size: 27,
    );
  }
}
