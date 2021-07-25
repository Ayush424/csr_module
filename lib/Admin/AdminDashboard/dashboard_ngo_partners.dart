import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Theme/colors.dart';
import 'package:flutter/material.dart';

class NgoPartners extends StatefulWidget {
  const NgoPartners({Key? key}) : super(key: key);

  @override
  State<NgoPartners> createState() => _NgoPartnersState();
}

class _NgoPartnersState extends State<NgoPartners> {
  static const int numItems2 = 10;
  List<bool> selected = List<bool>.generate(numItems2, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2)),
      height: 400,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("ngos").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text("No ngo partners",
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
                    return ItemCard2(
                      snapshot: snapshot,
                      numItems2: 10,
                      index: index,
                    );
                  });
            }
          }),
    );
  }
}

class ItemCard2 extends StatelessWidget {
  const ItemCard2({
    Key? key,
    required this.numItems2,
    required this.snapshot,
    required this.index,
  }) : super(key: key);
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  final int numItems2;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey.shade300,
      )),
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
              snapshot.data!.docs[index]["ngoYear"],
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
