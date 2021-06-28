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
      color: Colors.white,
      padding: const EdgeInsets.all(40),
      child: ListView(
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      FlatButton(
                        minWidth: 100,
                        color: Color.fromRGBO(229, 229, 229, 1),
                        child: Text("Profile"),
                        onPressed: () {
                          {
                            setState(() {
                              _homepage = 'profile';
                            });
                          }
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Color.fromRGBO(229, 229, 229, 1),
                        child: Text(
                          'Details',
                        ),
                        onPressed: () {
                          setState(() {
                            //  _homepage = 'details';
                          });
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Color.fromRGBO(229, 229, 229, 1),
                        child: Text(
                          'Documents',
                        ),
                        onPressed: () {
                          setState(() {
                            _homepage = 'documents';
                          });
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Color.fromRGBO(229, 229, 229, 1),
                        child: Text(
                          'Payroll',
                        ),
                        onPressed: () {
                          setState(() {
                            _homepage = 'payroll';
                          });
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Color.fromRGBO(229, 229, 229, 1),
                        child: Text(
                          'Trainings',
                        ),
                        onPressed: () {
                          setState(() {
                            _homepage = 'trainings';
                          });
                        },
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                        minWidth: 100,
                        color: Color.fromRGBO(229, 229, 229, 1),
                        child: Text(
                          'History',
                        ),
                        onPressed: () {
                          setState(() {
                            //  _homepage = 'history';
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
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
    );
  }
}
