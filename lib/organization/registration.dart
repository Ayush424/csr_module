import 'package:csr_module/Theme/colors.dart';

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class RegistrationForm extends StatefulWidget {
  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // AuthService _authService = AuthService();
  TextEditingController textController = TextEditingController();
  String interest = "Select a Category";
  String interest2 = "Select a Category";
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Wrap(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "CSR Cell - Registration form",
              style: TextStyle(
                  fontSize: 36, color: Color.fromARGB(255, 45, 55, 72)),
            ),
            const Divider(
              thickness: 3,
              color: Color.fromARGB(255, 237, 242, 247),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(),
                  //   child: Text(
                  //     "Category",
                  //     style: TextStyle(
                  //         color: darkblue,
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  Wrap(
                    spacing: 40,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              "Area of Interest-1",
                              style: TextStyle(
                                  color: darkblue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          DropdownButton(
                              focusColor: darkblue,
                              value: interest,
                              onChanged: (String? newValue) {
                                setState(() {
                                  interest = newValue!;
                                });
                              },
                              items: <String>[
                                "Select a Category",
                                "1",
                                "2",
                                "3"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(value),
                                  ),
                                );
                              }).toList()),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              "Area Of Interest-2",
                              style: TextStyle(
                                  color: darkblue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          DropdownButton(
                              focusColor: darkblue,
                              value: interest2,
                              onChanged: (String? newValue) {
                                setState(() {
                                  interest2 = newValue!;
                                });
                              },
                              items: <String>[
                                "Select a Category",
                                "1",
                                "2",
                                "3"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(value),
                                  ),
                                );
                              }).toList()),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      "Content",
                      style: TextStyle(
                          color: darkblue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    child: TextField(
                      controller: textController,
                      minLines: 5,
                      maxLines: 10,
                    ),
                    height: 200,
                  ),
                  Center(
                    child: GestureDetector(
                        child: Chip(
                          backgroundColor: darkblue,
                          label: Text(
                            "Apply",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onTap: () {}),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
