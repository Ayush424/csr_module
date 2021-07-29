import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Admin/Analytics/Beneficiary/beneficiary.dart';
import 'package:csr_module/Admin/Analytics/CSR_Activities/admin_activity.dart';
import 'package:csr_module/Admin/Analytics/CSR_Category/category.dart';
import 'package:csr_module/Admin/Analytics/CSR_Trainings/trainings.dart';
import 'package:csr_module/Admin/Analytics/Events/events.dart';
import 'package:csr_module/Admin/Analytics/Events/events_and_calender.dart';
import 'package:csr_module/Admin/Analytics/NGO_Partner/ngo_details.dart';
import 'package:csr_module/Admin/Analytics/NGO_Partner/ngo_partners1.dart';
import 'package:csr_module/Admin/Analytics/Payroll_giving_collection/Payroll.dart';
import 'package:csr_module/Admin/Analytics/Volunteering_Hours/volunteer.dart';
import 'package:csr_module/Admin/Analytics/Volunteering_Hours/volunteering_hours.dart';
import 'package:csr_module/Admin/News&Broadcast/broadcast_notification.dart';
import 'package:csr_module/Admin/News&Broadcast/broadcast_publish.dart';
import 'package:csr_module/Admin/Seller_Cart/seller_cart.dart';
import 'package:csr_module/Admin/Settings/setting_general.dart';
import 'package:csr_module/Admin/Settings/setting_security.dart';
import 'package:csr_module/Admin/admin_page_struct/admin_page_struct.dart';
import 'package:csr_module/Admin/Expense/expense.dart';
import 'package:csr_module/Admin/admin_page_struct/static_admin_page.dart';

import 'package:csr_module/Admin/AdminDashboard/admin_dashboard.dart';

import 'package:csr_module/auth/services/firebase_auth_service.dart';

import 'package:flutter/material.dart';

class AdminPageStructDesktop extends StatefulWidget {
  final ValueChanged<String>? update;
  const AdminPageStructDesktop({Key? key, this.update}) : super(key: key);

  @override
  _AdminPageStructDesktopState createState() => _AdminPageStructDesktopState();
}

class _AdminPageStructDesktopState extends State<AdminPageStructDesktop> {
  void _update(String adminpage) {
    setState(() {
      GlobalAdminPage.adminpage = adminpage;
    });
  }

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        width: 370,
        height: 120,
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
                child: Container(
                  height: 150,
                  width: 300,
                  child: Wrap(
                    spacing: 15,
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(snapshot.data!['imgUrl']))),
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

          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(_auth.returnCurrentUserid())
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return IconButton(
                      tooltip: 'User',
                      icon: Icon(Icons.account_circle, size: 50),
                      onPressed: () {});
                }
                return Builder(
                  builder: (context) => Transform(
                    transform: Matrix4.translationValues(-20, 0, 0),
                    child: IconButton(
                      iconSize: 100,
                      tooltip: 'User',
                      icon: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data!['imgUrl'])),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  ),
                );
              }),
          // DropdownButton(items: items)
        ],
        leading: const Icon(Icons.air_rounded),
        title: const Text(
          "CSR Management System",
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
                controller: ScrollController(),
                padding: const EdgeInsets.only(
                    top: 30, bottom: 100, left: 0, right: 0),
                children: [
                  Align(
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
                  SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    leading: const MyIcon(icon: Icons.assessment_outlined),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "Dashboard",
                        bold: (GlobalAdminPage.adminpage == 'adminDashboard'),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        GlobalAdminPage.adminpage = 'adminDashboard';
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
                        bold: (GlobalAdminPage.adminpage == 'analytics'),
                      ),
                    ),
                    children: [
                      ListTile(
                        title: MyText(
                          text: "NGO Partner",
                          bold: (GlobalAdminPage.adminpage == 'ngoPartner' ||
                              GlobalAdminPage.adminpage == 'ngoDetails'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalAdminPage.adminpage = 'ngoPartner';
                          });
                        },
                      ),
                      ListTile(
                        title: MyText(
                          text: "Beneficiary",
                          bold: (GlobalAdminPage.adminpage == 'beneficiary'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalAdminPage.adminpage = 'beneficiary';
                          });
                        },
                      ),
                      ListTile(
                        title: MyText(
                          text: "CSR Categories",
                          bold: (GlobalAdminPage.adminpage == 'categories'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalAdminPage.adminpage = 'categories';
                          });
                        },
                      ),
                      ListTile(
                        title: MyText(
                          text: "CSR Activities",
                          bold: (GlobalAdminPage.adminpage == 'activities'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalAdminPage.adminpage = 'activities';
                          });
                        },
                      ),
                      ListTile(
                        title: MyText(
                          text: "CSR Trainings",
                          bold: (GlobalAdminPage.adminpage == 'trainings'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalAdminPage.adminpage = 'trainings';
                          });
                        },
                      ),
                      ListTile(
                        title: MyText(
                          text: "Payroll giving collection",
                          bold: (GlobalAdminPage.adminpage ==
                              'payrollCollection'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalAdminPage.adminpage = 'payrollCollection';
                          });
                        },
                      ),
                      ListTile(
                        title: MyText(
                          text: "Volunteering Hours",
                          bold: (GlobalAdminPage.adminpage ==
                              'volunteeringHours'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalAdminPage.adminpage = 'volunteeringHours';
                          });
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    leading: const MyIcon(icon: Icons.group_outlined),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "Volunteer",
                        bold: (GlobalAdminPage.adminpage == 'volunteer'),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        GlobalAdminPage.adminpage = 'volunteer';
                      });
                    },
                  ),
                  ListTile(
                    leading: MyIcon(icon: Icons.payment_outlined),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "Expense",
                        bold: (GlobalAdminPage.adminpage == 'expense'),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        GlobalAdminPage.adminpage = 'expense';
                      });
                    },
                  ),
                  ListTile(
                    leading: const MyIcon(icon: Icons.shopping_cart),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "Seller Cart",
                        bold: (GlobalAdminPage.adminpage == 'sellerCart'),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        GlobalAdminPage.adminpage = 'sellerCart';
                      });
                    },
                  ),
                  ListTile(
                    leading: const MyIcon(icon: Icons.event_note),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "Events and Calendar",
                        bold: (GlobalAdminPage.adminpage == 'calender' ||
                            GlobalAdminPage.adminpage == 'eventsandcalendar'),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        GlobalAdminPage.adminpage = 'calender';
                      });
                    },
                  ),
                  ExpansionTile(
                    childrenPadding: const EdgeInsets.only(left: 40),
                    leading: const MyIcon(icon: Icons.record_voice_over),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "News and Broadcast",
                        bold: (GlobalAdminPage.adminpage == 'newsAndBroadcast'),
                      ),
                    ),
                    children: [
                      ListTile(
                        title: MyText(
                          text: "Publish News",
                          bold: (GlobalAdminPage.adminpage == 'publish'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalAdminPage.adminpage = 'publish';
                          });
                        },
                      ),
                      ListTile(
                        title: MyText(
                          text: "Broadcast Notification",
                          bold: (GlobalAdminPage.adminpage == 'notification'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalAdminPage.adminpage = 'notification';
                          });
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    childrenPadding: const EdgeInsets.only(left: 40),
                    leading: const MyIcon(icon: Icons.settings),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0, 0),
                      child: MyText(
                        text: "Settings",
                        bold: (GlobalAdminPage.adminpage == ''),
                      ),
                    ),
                    children: [
                      ListTile(
                        title: MyText(
                          text: "General",
                          bold: (GlobalAdminPage.adminpage == 'general'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalAdminPage.adminpage = 'general';
                          });
                        },
                      ),
                      ListTile(
                        title: MyText(
                          text: "Security",
                          bold: (GlobalAdminPage.adminpage == 'security'),
                        ),
                        onTap: () {
                          setState(() {
                            GlobalAdminPage.adminpage = 'security';
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Builder(builder: (context) {
              if (GlobalAdminPage.adminpage == 'adminDashboard') {
                return AdminDashboard();
              } else if (GlobalAdminPage.adminpage == 'ngoPartner') {
                return NgoPartner(update: _update);
              } else if (GlobalAdminPage.adminpage == 'categories') {
                return Categories();
              } else if (GlobalAdminPage.adminpage == 'activities') {
                return ActivityAdmin();
              } else if (GlobalAdminPage.adminpage == 'trainings') {
                return Trainings();
              } else if (GlobalAdminPage.adminpage == 'volunteeringHours') {
                return VolunteeringHours();
              } else if (GlobalAdminPage.adminpage == 'sellerCart') {
                return SellerCart();
              } else if (GlobalAdminPage.adminpage == 'publish') {
                return NewsBroadcast();
              } else if (GlobalAdminPage.adminpage == 'notification') {
                return BroadcastNotification();
              } else if (GlobalAdminPage.adminpage == 'payrollCollection') {
                return PayrollCollection();
              } else if (GlobalAdminPage.adminpage == 'expense') {
                return Expense();
              } else if (GlobalAdminPage.adminpage == 'general') {
                return Setting();
              } else if (GlobalAdminPage.adminpage == 'security') {
                return SettingSecurity();
              } else if (GlobalAdminPage.adminpage == 'calender') {
                return EventsAdmin(update: _update);
              } else if (GlobalAdminPage.adminpage == 'volunteer') {
                return Volunteer();
              } else if (GlobalAdminPage.adminpage == 'eventsandcalendar') {
                return Calender(update: _update);
              } else if (GlobalAdminPage.adminpage == 'beneficiary') {
                return Beneficiary();
              } else if (GlobalAdminPage.adminpage == 'ngoDetails') {
                return Partners(update: _update);
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
