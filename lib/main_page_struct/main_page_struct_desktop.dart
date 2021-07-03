import 'package:flutter/material.dart';
import 'package:csr_module/organization/organization.dart';
import 'package:csr_module/organization/registration.dart';
import 'package:csr_module/activity/activity.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:csr_module/homepage/homepage_assistance_give.dart';
import 'package:csr_module/homepage/homepage_assistance_need.dart';
import 'package:csr_module/homepage/homepage_dashboard.dart';
import '../homepage/homepage_structure.dart';

class MainPageStructDesktop extends StatefulWidget {
  const MainPageStructDesktop({Key? key}) : super(key: key);

  @override
  _MainPageStructDesktopState createState() => _MainPageStructDesktopState();
}

class _MainPageStructDesktopState extends State<MainPageStructDesktop> {
  String _mainpage = "myhome";

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active,
                color: Colors.white, size: 25),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(213, 63, 140, 1),
              ),
              child: const Text(
                'Pro plan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 50),
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.account_circle,
                size: 50.0, color: Colors.white),
          ),
          // DropdownButton(items: items)
        ],
        leading: const Icon(Icons.air_rounded),
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
                  ListTile(
                    leading: const MyIcon(icon: Icons.assessment_outlined),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "Dashboard",
                        bold: (_mainpage == 'dashboard'),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _mainpage = 'dashboard';
                      });
                    },
                  ),
                  ListTile(
                    leading: const MyIcon(icon: Icons.home_outlined),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "My Home",
                        bold: (_mainpage == 'myhome'),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _mainpage = 'myhome';
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
                        bold: (_mainpage == 'assistance'),
                      ),
                    ),
                    trailing: const MyIcon(icon: Icons.arrow_right),
                    children: [
                      ListTile(
                        title: MyText(
                          text: "I Can",
                          bold: (_mainpage == 'cangive'),
                        ),
                        onTap: () {
                          setState(() {
                            _mainpage = 'cangive';
                          });
                        },
                      ),
                      ListTile(
                        title: MyText(
                          text: "I Need",
                          bold: (_mainpage == 'ineed'),
                        ),
                        onTap: () {
                          setState(() {
                            _mainpage = "ineed";
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
                        bold: (_mainpage == 'csrcell'),
                      ),
                    ),
                    children: [
                      ListTile(
                        title: MyText(
                          text: "Core Team",
                          bold: (_mainpage == 'coreteam'),
                        ),
                        onTap: () {
                          setState(() {
                            _mainpage = 'coreteam';
                          });
                        },
                      ),
                      ListTile(
                        title: MyText(
                          text: "Registration Form",
                          bold: (_mainpage == 'registrationform'),
                        ),
                        onTap: () {
                          setState(() {
                            _mainpage = 'registrationform';
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
                        bold: (_mainpage == 'recurringevents'),
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const MyIcon(icon: Icons.extension),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "Activity",
                        bold: (_mainpage == 'activity'),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _mainpage = 'activity';
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
              if (_mainpage == 'cangive') {
                return AssistanceCanGive();
              } else if (_mainpage == 'ineed') {
                return AssistanceNeed();
              } else if (_mainpage == 'coreteam') {
                return Organization();
              } else if (_mainpage == 'myhome') {
                return HomePageStruct();
              } else if (_mainpage == 'activity') {
                return Activity();
              } else if (_mainpage == 'registrationform') {
                return RegistrationForm();
              } else if (_mainpage == 'dashboard') {
                return HomeDashboard();
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