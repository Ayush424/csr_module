import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Theme/Colors.dart';
import 'package:csr_module/auth/models/assistance_entry.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class AssistanceCanGive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final assistanceCollection =
        FirebaseFirestore.instance.collection('assistance');
    final assistanceStream = assistanceCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => AssistanceEntry.fromMap(doc.data()))
          .toList();
    });
    return StreamProvider<List<AssistanceEntry>?>(
      initialData: [],
      create: (_) => assistanceStream,
      child: Container(
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
                    child: MyListView(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    final List<AssistanceEntry>? items =
        Provider.of<List<AssistanceEntry>?>(context);
    return ListView.builder(
      itemCount: items?.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionTile(
          childrenPadding: EdgeInsets.symmetric(horizontal: 20),
          tilePadding: EdgeInsets.symmetric(horizontal: 30),
          collapsedBackgroundColor: (index % 2 == 0) ? Colors.white : teal,
          backgroundColor: (index % 2 == 0) ? Colors.white : teal,
          title: Wrap(
            spacing: MediaQuery.of(context).size.width / 5,
            children: [
              Text(
                items![index].category,
                style: TextStyle(
                    color: darkblue, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "posted on " +
                    items[index].date.toDate().day.toString() +
                    "-" +
                    items[index].date.toDate().month.toString() +
                    '-' +
                    items[index].date.toDate().year.toString(),
                style: TextStyle(color: lightblue, fontSize: 15),
              ),
            ],
          ),
          subtitle: Text(
            "posted by " + items[index].convertpostedyBy(items[index].postedBy),
            style: TextStyle(color: Color.fromARGB(255, 204, 204, 204)),
          ),
          children: [
            ListTile(
              title: Text(items[index].content),
              trailing: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    backgroundColor: MaterialStateProperty.all(darkblue)),
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
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
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
    );
  }
}
