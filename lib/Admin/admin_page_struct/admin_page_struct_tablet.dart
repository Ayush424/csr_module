import 'package:csr_module/Admin/Analytics/Beneficiary/beneficiary.dart';
import 'package:csr_module/Admin/Analytics/CSR_Activities/admin_activity.dart';
import 'package:csr_module/Admin/Analytics/CSR_Category/category.dart';
import 'package:csr_module/Admin/Analytics/CSR_Trainings/trainings.dart';
import 'package:csr_module/Admin/Analytics/Events/events.dart';
import 'package:csr_module/Admin/Analytics/Events/events_and_calender.dart';
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
import 'package:csr_module/User/activity/activity.dart';
import 'package:csr_module/User/main_page_struct/main_page_struct.dart';

import 'package:csr_module/Admin/AdminDashboard/admin_dashboard.dart';

import 'package:flutter/material.dart';

class AdminPageStructTablet extends StatefulWidget {
  final ValueChanged<String>? update;

  const AdminPageStructTablet({Key? key, this.update}) : super(key: key);

  @override
  _AdminPageStructTabletState createState() => _AdminPageStructTabletState();
}

class _AdminPageStructTabletState extends State<AdminPageStructTablet> {
  void _update(String mainpage) {
    setState(() {
      GlobalAdminPage.adminpage = mainpage;
    });
  }

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
                              widget.update!("user");
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
                              widget.update!("admin");
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
                          bold: (GlobalAdminPage.adminpage == ''),
                        ),
                      ),
                      trailing: const MyIcon(icon: Icons.arrow_right),
                      children: [
                        ListTile(
                          title: MyText(
                            text: "NGO Partner",
                            bold: (GlobalAdminPage.adminpage == 'ngoPartner'),
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
                            text: "Products Sale",
                            bold: (GlobalAdminPage.adminpage == ''),
                          ),
                          onTap: () {},
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
                          bold: (GlobalAdminPage.adminpage == 'calender'),
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
                          bold:
                              (GlobalAdminPage.adminpage == 'newsAndBroadcast'),
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
            ],
          ),
        ),
        body: Builder(builder: (context) {
          if (GlobalAdminPage.adminpage == 'adminDashboard') {
            return AdminDashboard();
          } else if (GlobalAdminPage.adminpage == 'ngoPartner') {
            return NgoPartner();
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
