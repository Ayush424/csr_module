import 'package:csr_module/events_and_calendar/calendar.dart';
import 'package:csr_module/organization/dollar_for_dollar.dart';
import '../homepage/static_homepage.dart';
import 'static_mainpage.dart';
import 'package:flutter/material.dart';
import 'package:csr_module/organization/organization.dart';
import 'package:csr_module/organization/registration.dart';
import 'package:csr_module/activity/activity.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:csr_module/assistance/assistance_give.dart';
import 'package:csr_module/assistance/assistance_need.dart';
import 'package:csr_module/dashboard/dashboard.dart';
import '../homepage/homepage_structure.dart';

class MainPageStructTablet extends StatefulWidget {
  const MainPageStructTablet({Key? key}) : super(key: key);

  @override
  _MainPageStructTabletState createState() => _MainPageStructTabletState();
}

class _MainPageStructTabletState extends State<MainPageStructTablet> {
  //String GlobalMainPage.mainpage = "dashboard";
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
      appBar: AppBar(
        actions: [
          Flexible(
            flex: 2,
            child: IconButton(
              onPressed: () {
                _auth.loadMyData();
              },
              tooltip: 'Notifications',
              icon: const Icon(Icons.notifications_active,
                  color: Colors.white, size: 25),
            ),
          ),
          Flexible(
            flex: 1,
            child: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: 'Menu',
                icon: const Icon(Icons.menu, size: 30.0, color: Colors.white),
              ),
            ),
          ),
        ],
        leading: const Icon(Icons.air_rounded),
        title: const Text(
          "CSR Management",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 45, 55, 72),
      ),
      drawer: Drawer(
        child: Row(
          children: [
            Expanded(
              child: ListView(
                controller: ScrollController(),
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text(
                      'Employee Name',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    accountEmail: Text('Employee Profession'),
                    currentAccountPicture: Icon(
                      Icons.account_circle_rounded,
                      size: 75,
                      color: Colors.white70,
                    ),
                    otherAccountsPictures: [
                      IconButton(
                        icon: Icon(
                          Icons.logout,
                          color: Colors.white70,
                        ),
                        onPressed: () async {
                          await _auth.signOut();
                        },
                        tooltip: 'Logout',
                      ),
                    ],
                  ),
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
          ],
        ),
      ),
      body: Builder(builder: (context) {
        if (GlobalMainPage.mainpage == 'cangive') {
          return AssistanceCanGive();
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
          color: Colors.grey[800],
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
      color: Colors.grey[800],
      size: 27,
    );
  }
}
