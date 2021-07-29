import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Admin/seller_cart/seller_cart_dialoguebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SellerCart extends StatefulWidget {
  const SellerCart({Key? key}) : super(key: key);

  @override
  _SellerCartState createState() => _SellerCartState();
}

class _SellerCartState extends State<SellerCart> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  Future showMyDialog(String docId) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SellerCartDialogue(docId: docId);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      ///constraints: BoxConstraints.expand(),
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: ListView(
        shrinkWrap: true,
        controller: ScrollController(),
        children: [
          ListTile(
            title: Text(
              'Seller Cart',
              style: TextStyle(
                  fontSize: 36, color: Color.fromARGB(255, 42, 67, 101)),
            ),
          ),
          Divider(
            thickness: 3,
            color: Color.fromARGB(255, 237, 242, 247),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            title: Text(
              'Pending Orders',
              style: TextStyle(
                  fontSize: 28, color: Color.fromARGB(255, 42, 67, 101)),
            ),
          ),
          Container(
            height: 210,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                      controller: ScrollController(),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SingleChildScrollView(
                          controller: ScrollController(),
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints(minWidth: constraints.minWidth),

                            child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("orders")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.data!.docs.length == 0) {
                                    return Text("no pending orders");
                                  } else {
                                    return DataTable(
                                      columns: const <DataColumn>[
                                        DataColumn(
                                          label: Text('Employee Code',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                        DataColumn(
                                          label: Text('Name ',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                        DataColumn(
                                          label: Text('Order Date',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                        DataColumn(
                                          label: Text('Amount',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                        DataColumn(
                                          label: Text(''),
                                        ),
                                        DataColumn(
                                          label: Text(''),
                                        ),
                                      ],
                                      rows: List<DataRow>.generate(
                                        snapshot.data!.docs.length,
                                        (int index) => DataRow(
                                          color: MaterialStateProperty
                                              .resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return Color.fromARGB(
                                                      255, 237, 242, 247)
                                                  .withOpacity(0.08);
                                            }
                                            if (index.isEven) {
                                              return Color.fromARGB(
                                                  255, 237, 242, 247);
                                            }
                                            return null;
                                          }),
                                          cells: <DataCell>[
                                            DataCell(
                                              Text(snapshot.data!.docs[index]
                                                  ["empcode"]),
                                            ),
                                            DataCell(
                                              Text(snapshot.data!.docs[index]
                                                  ["name"]),
                                            ),
                                            DataCell(
                                              Text(
                                                snapshot
                                                        .data!
                                                        .docs[index]
                                                            ["orderDate"]
                                                        .toDate()
                                                        .day
                                                        .toString() +
                                                    "/" +
                                                    snapshot
                                                        .data!
                                                        .docs[index]
                                                            ["orderDate"]
                                                        .toDate()
                                                        .month
                                                        .toString() +
                                                    "/" +
                                                    snapshot
                                                        .data!
                                                        .docs[index]
                                                            ["orderDate"]
                                                        .toDate()
                                                        .year
                                                        .toString(),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                snapshot
                                                    .data!.docs[index]["value"]
                                                    .toString(),
                                              ),
                                            ),
                                            DataCell(
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              Color.fromRGBO(44,
                                                                  82, 130, 1),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          )),
                                                  onPressed: () {
                                                    String docId = snapshot
                                                        .data!.docs[index].id;
                                                    showMyDialog(docId);
                                                  },
                                                  child: Text(
                                                    'View Order',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 252, 254, 1)),
                                                  )),
                                            ),
                                            DataCell(
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Colors.pink,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          )),
                                                  onPressed: () {
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            "Completedorders")
                                                        .add({
                                                      "name": snapshot.data!
                                                          .docs[index]["name"],
                                                      "empcode": snapshot
                                                              .data!.docs[index]
                                                          ["empcode"],
                                                      "orderDate": snapshot
                                                              .data!.docs[index]
                                                          ["orderDate"],
                                                      "uid": snapshot.data!
                                                          .docs[index]["uid"],
                                                      "value": snapshot.data!
                                                          .docs[index]["value"],
                                                      "deliveryDate":
                                                          DateTime.now(),
                                                    }).then((value) {
                                                      FirebaseFirestore.instance
                                                          .collection("orders")
                                                          .doc(snapshot.data!
                                                              .docs[index].id)
                                                          .delete();
                                                    });
                                                  },
                                                  child: Text(
                                                    'Mark as Delivered',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1)),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                }),

                          ),
                        ),
                      ),
                    )),
          ),
          SizedBox(
            height: 50,
          ),
          ListTile(
            title: Text(
              'Completed Orders',
              style: TextStyle(
                  fontSize: 28, color: Color.fromARGB(255, 42, 67, 101)),
            ),
          ),
          Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              height: 210,

              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Completedorders")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.data!.docs.length == 0) {
                          return Text("no completed orders");
                        } else {
                          return DataTable(
                            columnSpacing: 95,
                            columns: const <DataColumn>[
                              DataColumn(
                                label: Text('Emp Code',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                              DataColumn(
                                label: Text('Name ',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                              DataColumn(
                                label: Text('Order Date',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                              DataColumn(
                                label: Text('Delivery Date',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                              DataColumn(
                                label: Text('Total Amount',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                              // DataColumn(
                              //   label: Text(''),
                              // ),
                            ],
                            rows: List<DataRow>.generate(
                              snapshot.data!.docs.length,
                              (int index) => DataRow(
                                color:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Color.fromARGB(255, 237, 242, 247)
                                        .withOpacity(0.08);
                                  }
                                  if (index.isEven) {
                                    return Color.fromARGB(255, 237, 242, 247);
                                  }
                                  return null;
                                }),
                                cells: <DataCell>[
                                  DataCell(
                                    Text(snapshot.data!.docs[index]["empcode"]),
                                  ),
                                  DataCell(
                                    Text(snapshot.data!.docs[index]["name"]),
                                  ),
                                  DataCell(
                                    Text(
                                      snapshot.data!.docs[index]["orderDate"]
                                              .toDate()
                                              .day
                                              .toString() +
                                          "/" +
                                          snapshot
                                              .data!.docs[index]["orderDate"]
                                              .toDate()
                                              .month
                                              .toString() +
                                          "/" +
                                          snapshot
                                              .data!.docs[index]["orderDate"]
                                              .toDate()
                                              .year
                                              .toString(),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      snapshot.data!.docs[index]["deliveryDate"]
                                              .toDate()
                                              .day
                                              .toString() +
                                          "/" +
                                          snapshot
                                              .data!.docs[index]["deliveryDate"]
                                              .toDate()
                                              .month
                                              .toString() +
                                          "/" +
                                          snapshot
                                              .data!.docs[index]["deliveryDate"]
                                              .toDate()
                                              .year
                                              .toString(),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        snapshot.data!.docs[index]["value"]
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                  // DataCell(
                                  //   ElevatedButton(
                                  //       style: ElevatedButton.styleFrom(
                                  //           primary: Color.fromRGBO(44, 82, 130, 1),
                                  //           shape: RoundedRectangleBorder(
                                  //             borderRadius: BorderRadius.circular(50),
                                  //           )),
                                  //       onPressed: () {
                                  //         showDialog(
                                  //             context: context,
                                  //             builder: (_) => SellerCartDialogue(
                                  //                   docId: "",
                                  //                 ));
                                  //       },
                                  //       child: Text(
                                  //         'View Order',
                                  //         style: TextStyle(
                                  //             color: Color.fromRGBO(255, 252, 254, 1)),
                                  //       )),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        }
                      }),

                ),
              )),
        ],
      ),
    );
  }
}
