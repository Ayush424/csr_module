import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewsBroadcast extends StatefulWidget {
  const NewsBroadcast({Key? key}) : super(key: key);

  @override
  _NewsBroadcastState createState() => _NewsBroadcastState();
}

class _NewsBroadcastState extends State<NewsBroadcast> {
  TextEditingController controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      'News & Broadcast',
                      style: TextStyle(
                          color: Color.fromARGB(255, 42, 67, 101),
                          fontSize: 36,
                          decoration: TextDecoration.none),
                    ),
                    Divider(
                      color: Color.fromARGB(255, 226, 232, 240),
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Enter News',
                      style: TextStyle(
                          color: Color.fromARGB(255, 42, 67, 101),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 150,
                      child: TextField(
                        controller: controller1,
                        minLines: 5,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: 'Enter Details',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                          child: Chip(
                            backgroundColor: Color.fromARGB(255, 45, 55, 72),
                            label: Text(
                              "Publish",
                              style: TextStyle(color: Colors.white),
                            ),
                            avatar: Icon(
                              Icons.post_add,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            final Map<String, dynamic> entry = {
                              'News': controller1.text,
                              'date': Timestamp.now(),
                            };

                            if (controller1.text.isNotEmpty) {
                              FirebaseFirestore.instance
                                  .collection('news')
                                  .add(entry)
                                  .then(
                                    (result) => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        content: SizedBox(
                                          height: 150,
                                          child: Center(
                                            child: Text(
                                              'Posted Successfully',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                              controller1.clear();
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        content: Text(
                                          'Please fill all the fields',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.red),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ));
                            }
                          }),
                    )
                  ])))),
    );
  }
}
