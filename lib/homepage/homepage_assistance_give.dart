import 'package:csr_module/Theme/Colors.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class AssistanceCanGive extends StatelessWidget {
  List<String> items = [
    "hello",
    "this is working",
    "i need help",
    "can someone help",
    "help regarding project",
    "some help",
    "1",
    "2",
    "3",
    "4",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Wrap(
          //crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Assistance - I Can",
              style: TextStyle(
                  fontSize: 36, color: Color.fromARGB(255, 45, 55, 72)),
            ),
            const Divider(
              thickness: 3,
              color: Color.fromARGB(255, 237, 242, 247),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                height: 500,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 204, 204, 204))),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(horizontal: 30),
                        collapsedBackgroundColor:
                            (index % 2 == 0) ? Colors.white : teal,
                        backgroundColor: (index % 2 == 0) ? Colors.white : teal,
                        title: Text(
                          items[index],
                          style: TextStyle(
                              color: darkblue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          items[index],
                          style: TextStyle(
                              color: Color.fromARGB(255, 204, 204, 204)),
                        ),
                        children: [
                          ListTile(
                            title: Text(index.toString()),
                            trailing: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(darkblue)),
                              child: Text(
                                "Help",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                    'Contact details',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  content: SizedBox(
                                    height: 100,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Contact number: xxxxxxxxxxx',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          'Email Address: xxxxxxxx@gmail.com',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: items.length,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
