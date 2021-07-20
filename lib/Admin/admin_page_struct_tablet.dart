import 'package:csr_module/Admin/admin_page_struct.dart';
import 'package:csr_module/dashboard/admin_dashboard.dart';
import 'package:csr_module/main_page_struct/main_page_struct.dart';
import 'package:flutter/material.dart';

class AdminPageStructTablet extends StatefulWidget {
  const AdminPageStructTablet({Key? key}) : super(key: key);

  @override
  _AdminPageStructTabletState createState() => _AdminPageStructTabletState();
}

class _AdminPageStructTabletState extends State<AdminPageStructTablet> {
  String _adminpage = 'adminDashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Flexible(
              flex: 2,
              child: IconButton(
                onPressed: () {},
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
                          onPressed: () //async
                              {
                            //  await _auth.signOut();
                          },
                          tooltip: 'Logout',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        runSpacing: 10,
                        spacing: 20,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPageStruct()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(45, 55, 72, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                )),
                            child: Text(
                              "Main Panel",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminPageStruct()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(255, 75, 162, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                )),
                            child: Text(
                              "Control Panel",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: const MyIcon(icon: Icons.assessment_outlined),
                      title: Transform(
                        transform: Matrix4.translationValues(-16, 0, 0),
                        child: MyText(
                          text: "Dashboard",
                          bold: (_adminpage == 'adminDashboard'),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _adminpage = 'adminDashboard';
                        });
                      },
                    ),
                    ExpansionTile(
                      childrenPadding: const EdgeInsets.only(
                        left: 40,
                      ),
                      leading: MyIcon(icon: Icons.pie_chart),
                      title: Transform(
                        transform: Matrix4.translationValues(-16, 0, 0),
                        child: MyText(
                          text: "Analytics",
                          bold: (_adminpage == ''),
                        ),
                      ),
                      trailing: const MyIcon(icon: Icons.arrow_right),
                      children: [
                        ListTile(
                          title: MyText(
                            text: "NGO Partner",
                            bold: (_adminpage == ''),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: MyText(
                            text: "Beneficiary",
                            bold: (_adminpage == ''),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: MyText(
                            text: "CSR Categories",
                            bold: (_adminpage == ''),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: MyText(
                            text: "CSR Activities",
                            bold: (_adminpage == ''),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: MyText(
                            text: "CSR Events",
                            bold: (_adminpage == ''),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: MyText(
                            text: "CSR Trainings",
                            bold: (_adminpage == ''),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: MyText(
                            text: "Payroll giving collection",
                            bold: (_adminpage == ''),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: MyText(
                            text: "Products Sale",
                            bold: (_adminpage == ''),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: MyText(
                            text: "Volunteering Hours",
                            bold: (_adminpage == ''),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    ListTile(
                      leading: const MyIcon(icon: Icons.group_outlined),
                      title: Transform(
                        transform: Matrix4.translationValues(-16, 0, 0),
                        child: MyText(
                          text: "Volunteer",
                          bold: (_adminpage == ''),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: MyIcon(icon: Icons.payment_outlined),
                      title: Transform(
                        transform: Matrix4.translationValues(-16, 0, 0),
                        child: MyText(
                          text: "Expense",
                          bold: (_adminpage == ''),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const MyIcon(icon: Icons.shopping_cart),
                      title: Transform(
                        transform: Matrix4.translationValues(-16, 0, 0),
                        child: MyText(
                          text: "Seller Cart",
                          bold: (_adminpage == ''),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const MyIcon(icon: Icons.library_books),
                      title: Transform(
                        transform: Matrix4.translationValues(-16, 0, 0),
                        child: MyText(
                          text: "Forms",
                          bold: (_adminpage == ''),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const MyIcon(icon: Icons.event_note),
                      title: Transform(
                        transform: Matrix4.translationValues(-16, 0, 0),
                        child: MyText(
                          text: "Events and Calendar",
                          bold: (_adminpage == ''),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const MyIcon(icon: Icons.record_voice_over),
                      title: Transform(
                        transform: Matrix4.translationValues(-16, 0, 0),
                        child: MyText(
                          text: "News and Broadcast",
                          bold: (_adminpage == ''),
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const MyIcon(icon: Icons.settings),
                      title: Transform(
                        transform: Matrix4.translationValues(-16, 0, 0),
                        child: MyText(
                          text: "Settings",
                          bold: (_adminpage == ''),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Builder(builder: (context) {
          if (_adminpage == 'adminDashboard') {
            return AdminDashboard();
          } else {
            return Container();
          }
        }));
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
