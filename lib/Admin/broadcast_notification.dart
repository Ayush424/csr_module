import 'package:flutter/material.dart';

class BroadcastNotification extends StatefulWidget {
  const BroadcastNotification({ Key? key }) : super(key: key);

  @override
  _BroadcastNotification createState() => _BroadcastNotification();
}

class _BroadcastNotification extends State<BroadcastNotification> {
  TextEditingController controller1= TextEditingController();
  
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
                  Text('Enter Notification',
                  style: TextStyle(
                        color: Color.fromARGB(255, 42, 67, 101),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          child: TextField(
                            controller: controller1,
                            minLines: 5,
                              maxLines: 10,
                            decoration: InputDecoration(hintText: 'Enter Details',
                            border: OutlineInputBorder(),
                            
                            ),
                          ),
                        ),
                        Center(
                        child: GestureDetector(
                            child: Chip(
                              backgroundColor: Color.fromARGB(255,45, 55, 72) ,
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
                              setState(() {
                                
                              });
                            }
                        ),
                        )
                ]
              )
            )
          )
        
      ),
    );
  }
}