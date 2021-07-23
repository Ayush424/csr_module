import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Theme/colors.dart';
import 'package:flutter/material.dart';

class CsrEvents extends StatefulWidget {
  const CsrEvents({Key? key}) : super(key: key);

  @override
  State<CsrEvents> createState() => _CsrEventsState();
}

class _CsrEventsState extends State<CsrEvents> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2)),
      height: 400,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('events').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                    "No events added try adding some in the events and calendar section",
                    style: TextStyle(
                        color: lightblue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              );
            } else {
              return ListView.builder(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ItemCard(
                      snapshot: snapshot,
                      index: index,
                      numItems: 10,
                    );
                  });
            }
          }),
    );
  }
}

class ItemCard extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  final int index;
  const ItemCard({
    Key? key,
    required this.numItems,
    required this.snapshot,
    required this.index,
  }) : super(key: key);
  final int numItems;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Text(
              snapshot.data!.docs[index]["name"],
              style: TextStyle(
                  color: Color.fromRGBO(45, 55, 72, 1),
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
          Flexible(
            child: Text(
              snapshot.data!.docs[index]["startdate"].toDate().day.toString() +
                  '-' +
                  snapshot.data!.docs[index]["startdate"]
                      .toDate()
                      .month
                      .toString() +
                  '-' +
                  snapshot.data!.docs[index]["startdate"]
                      .toDate()
                      .year
                      .toString(),
              style: TextStyle(
                color: Color.fromRGBO(45, 55, 72, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
