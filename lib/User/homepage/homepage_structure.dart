import 'package:csr_module/User/homepage/homepage_setgoals.dart';
import 'static_homepage.dart';
import 'package:flutter/material.dart';
import 'homepage_documents.dart';
import 'homepage_training.dart';
import 'homepage_payroll.dart';
import 'homepage_profile.dart';

class HomePageStruct extends StatefulWidget {
  const HomePageStruct({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<HomePageStruct> {
  //String GlobalHomePage.homepage = 'profile';
  @override
//row data

  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: ListView(
          controller: ScrollController(),
          children: [
            const Text(
              "My Home",
              style: TextStyle(
                fontSize: 36,
                color: Color.fromARGB(255, 42, 67, 101),
              ),
            ),
            const Divider(
              thickness: 3,
              color: Color.fromARGB(255, 237, 242, 247),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 5,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(100, 40)),
                            backgroundColor:
                                GlobalHomePage.homepage == 'profile'
                                    ? MaterialStateProperty.all(Colors.white)
                                    : MaterialStateProperty.all(
                                        Color.fromRGBO(247, 250, 252, 1)),
                          ),
                          onPressed: () {
                            {
                              setState(() {
                                GlobalHomePage.homepage = 'profile';
                              });
                            }
                          },
                          child: const Text(
                            'Profile',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ), //profile

                        SizedBox(height: 5),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(140, 40)),
                            backgroundColor:
                                GlobalHomePage.homepage == 'documents'
                                    ? MaterialStateProperty.all(Colors.white)
                                    : MaterialStateProperty.all(
                                        Color.fromRGBO(247, 250, 252, 1)),
                          ),
                          onPressed: () {
                            setState(() {
                              GlobalHomePage.homepage = 'documents';
                            });
                          },
                          child: const Text(
                            'Documents',
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ), //Documents

                        SizedBox(height: 5),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(100, 40)),
                            backgroundColor:
                                GlobalHomePage.homepage == 'payroll'
                                    ? MaterialStateProperty.all(Colors.white)
                                    : MaterialStateProperty.all(
                                        Color.fromRGBO(247, 250, 252, 1)),
                          ),
                          onPressed: () {
                            setState(() {
                              GlobalHomePage.homepage = 'payroll';
                            });
                          },
                          child: const Text(
                            'Payroll',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ), //Payroll

                        SizedBox(height: 5),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(140, 40)),
                            backgroundColor:
                                GlobalHomePage.homepage == 'trainings'
                                    ? MaterialStateProperty.all(Colors.white)
                                    : MaterialStateProperty.all(
                                        Color.fromRGBO(247, 250, 252, 1)),
                          ),
                          onPressed: () {
                            setState(() {
                              GlobalHomePage.homepage = 'trainings';
                            });
                          },
                          child: const Text(
                            'Trainings',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ), //Training
                        SizedBox(height: 5),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(170, 40)),
                            backgroundColor:
                                GlobalHomePage.homepage == 'setgoals'
                                    ? MaterialStateProperty.all(Colors.white)
                                    : MaterialStateProperty.all(
                                        Color.fromRGBO(247, 250, 252, 1)),
                          ), //history
                          onPressed: () {
                            setState(() {
                              GlobalHomePage.homepage = 'setgoals';
                            });
                          },

                          child: const Text(
                            'Set Your Goals',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Builder(builder: (context) {
              if (GlobalHomePage.homepage == 'profile') {
                return HomeProfile();
              }
              //  else if (GlobalHomePage.homepage == 'details') {
              //   return;
              // }
              else if (GlobalHomePage.homepage == 'documents') {
                return HomeDocuments();
              } else if (GlobalHomePage.homepage == 'payroll') {
                return HomePayroll();
              } else if (GlobalHomePage.homepage == 'trainings') {
                return HomeTrainings();
              } else if (GlobalHomePage.homepage == 'setgoals') {
                return SetGoals();
              } else {
                return HomeProfile();
              }
            })
          ],
        ),
      ),
    );
  }
}
