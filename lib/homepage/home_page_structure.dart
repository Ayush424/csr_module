import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:csr_module/homepage/homepage_assistance_give.dart';
import 'package:csr_module/homepage/homepage_profile.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomePageStruct extends StatelessWidget {
  final String _homepage = "cangive";
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
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 26),
                children: [
                  ListTile(
                    leading: const MyIcon(icon: Icons.assessment_outlined),
                    title: const MyText(text: "Dashboard"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const MyIcon(icon: Icons.home_outlined),
                    title: const MyText(text: "My Home"),
                    onTap: () {},
                  ),
                  ExpansionTile(
                    childrenPadding: const EdgeInsets.only(
                      left: 70,
                    ),
                    leading: const MyIcon(icon: Icons.help_outline),
                    title: const MyText(text: "Assistance"),
                    trailing: const MyIcon(icon: Icons.arrow_right),
                    children: [
                      ListTile(
                        title: const MyText(text: "I can"),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const MyText(text: "I need"),
                        onTap: () {},
                      ),
                    ],
                  ),
                  ExpansionTile(
                    childrenPadding: const EdgeInsets.only(left: 45),
                    leading: const MyIcon(icon: Icons.people_outline_outlined),
                    trailing: const MyIcon(icon: Icons.arrow_right),
                    title: const MyText(text: "CSR Cell"),
                    children: [
                      ListTile(
                        title: const MyText(text: "Core Team"),
                        onTap: () {},
                      ),
                      ExpansionTile(
                        childrenPadding: EdgeInsets.only(left: 30),
                        trailing: const MyIcon(icon: Icons.arrow_right),
                        title: const MyText(text: "Registration Form"),
                        children: [
                          ListTile(
                            title: const MyText(text: "Core team"),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const MyText(text: "Recurring events"),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  ListTile(
                    leading: const MyIcon(icon: Icons.extension),
                    title: const MyText(text: "Activity"),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Builder(builder: (context) {
              if (_homepage == 'cangive') {
                return AssistanceCanGive();
              } else {
                return const MyHome();
              }
            }),
          ),
        ],
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
      size: 28,
    );
  }
}
