import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
//import 'homepagedocuments.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.logout_outlined))
        ],
        title: Text('CSR MANAGEMENT'),
        backgroundColor: Colors.blue[900],
        leading: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Material(
            shape: new CircleBorder(),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "MY Home",
              style: TextStyle(fontSize: 30),
            ),
            Divider(
              color: Colors.black,
              height: 15,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            SizedBox(height: 30),
            FlatButton(
              minWidth: 100,
              color: Colors.grey,
              child: Text(
                'Profile',
              ),
              onPressed: () {
                setState(() {});
              },
            ),
            SizedBox(height: 5),
            FlatButton(
              minWidth: 100,
              color: Colors.grey,
              child: Text(
                'Details',
              ),
              onPressed: () {
                setState(() {});
              },
            ),
            SizedBox(height: 5),
            FlatButton(
              minWidth: 100,
              color: Colors.grey,
              child: Text(
                'Documents',
              ),
              onPressed: () {
                //  Navigator.push(
                //  context,
                // MaterialPageRoute(builder: (context) => homepagedocuments()),
                //);
              },
            ),
            SizedBox(height: 5),
            FlatButton(
              minWidth: 100,
              color: Colors.grey,
              child: Text(
                'Bank',
              ),
              onPressed: () {
                setState(() {});
              },
            ),
            SizedBox(height: 5),
            FlatButton(
              minWidth: 100,
              color: Colors.grey,
              child: Text(
                'Payroll',
              ),
              onPressed: () {
                setState(() {});
              },
            ),
            SizedBox(height: 5),
            FlatButton(
              minWidth: 100,
              color: Colors.grey,
              child: Text(
                'Trainings',
              ),
              onPressed: () {
                setState(() {});
              },
            ),
            SizedBox(height: 5),
            FlatButton(
              minWidth: 100,
              color: Colors.grey,
              child: Text(
                'History',
              ),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
