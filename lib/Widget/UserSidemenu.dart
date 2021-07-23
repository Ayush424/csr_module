import 'package:csr_module/User/main_page_struct/static_mainpage.dart';
import 'package:flutter/material.dart';

class UserSidemenu extends StatefulWidget {
  const UserSidemenu({Key? key}) : super(key: key);

  @override
  _UserSidemenuState createState() => _UserSidemenuState();
}

class _UserSidemenuState extends State<UserSidemenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 237, 242, 247),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
        children: [
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
