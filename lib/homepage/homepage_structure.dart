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
  String _homepage = 'profile';
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
                      spacing: 10,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(100, 40)),
                            backgroundColor: _homepage == 'profile'
                                ? MaterialStateProperty.all(Colors.white)
                                : MaterialStateProperty.all(
                                    Color.fromRGBO(229, 229, 229, 1)),
                          ),
                          onPressed: () {
                            {
                              setState(() {
                                _homepage = 'profile';
                              });
                            }
                          },
                          child: const Text(
                            'Profile',
                            style: TextStyle(color: Colors.black),
                          ),
                        ), //profile

                        SizedBox(height: 5),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(110, 40)),
                            backgroundColor: _homepage == 'documents'
                                ? MaterialStateProperty.all(Colors.white)
                                : MaterialStateProperty.all(
                                    Color.fromRGBO(229, 229, 229, 1)),
                          ),
                          onPressed: () {
                            setState(() {
                              _homepage = 'documents';
                            });
                          },
                          child: const Text(
                            'Documents',
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(color: Colors.black),
                          ),
                        ), //Documents

                        SizedBox(height: 5),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(100, 40)),
                            backgroundColor: _homepage == 'payroll'
                                ? MaterialStateProperty.all(Colors.white)
                                : MaterialStateProperty.all(
                                    Color.fromRGBO(229, 229, 229, 1)),
                          ),
                          onPressed: () {
                            setState(() {
                              _homepage = 'payroll';
                            });
                          },
                          child: const Text(
                            'Payroll',
                            style: TextStyle(color: Colors.black),
                          ),
                        ), //Payroll

                        SizedBox(height: 5),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(100, 40)),
                            backgroundColor: _homepage == 'trainings'
                                ? MaterialStateProperty.all(Colors.white)
                                : MaterialStateProperty.all(
                                    Color.fromRGBO(229, 229, 229, 1)),
                          ),
                          onPressed: () {
                            setState(() {
                              _homepage = 'trainings';
                            });
                          },
                          child: const Text(
                            'Trainings',
                            style: TextStyle(color: Colors.black),
                          ),
                        ), //Training
                        SizedBox(height: 5),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(100, 40)),
                            backgroundColor: _homepage == 'setgoals'
                                ? MaterialStateProperty.all(Colors.white)
                                : MaterialStateProperty.all(
                                    Color.fromRGBO(229, 229, 229, 1)),
                          ), //history
                          onPressed: () {
                            setState(() {
                              _homepage = 'setgoals';
                            });
                          },

                          child: const Text(
                            'Set Your Goals',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Builder(builder: (context) {
              if (_homepage == 'profile') {
                return HomeProfile();
              }
              //  else if (_homepage == 'details') {
              //   return;
              // }
              else if (_homepage == 'documents') {
                return HomeDocuments();
              } else if (_homepage == 'payroll') {
                return HomePayroll();
              } else if (_homepage == 'trainings') {
                return HomeTrainings();
              }
              // else if (_homepage == 'history') {
              //   return ;
              // }
              else {
                return HomeProfile();
              }
            })
          ],
        ),
      ),
    );
  }
}
