// import 'dart:html';

// import 'productdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:csr_module/auth/services/firebase_auth_service.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final AuthService _authService = AuthService();
  Future<void> _showMyDialog(
      String name, String empcode, List<QueryDocumentSnapshot> list) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: <Widget>[
                Text('Do you want to confirm your order?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () async {
                int total = 0;
                for (QueryDocumentSnapshot doc in list) {
                  int price = doc.get("price");

                  total += price;
                }

                FirebaseFirestore.instance.collection("orders").add({
                  "name": name,
                  "empcode": empcode,
                  "orderDate": DateTime.now(),
                  "uid": _authService.returnCurrentUserid(),
                  "value": total,
                }).then((value) {
                  for (QueryDocumentSnapshot doc in list) {
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(_authService.returnCurrentUserid())
                        .collection("cart")
                        .doc(doc.id)
                        .delete();
                    FirebaseFirestore.instance
                        .collection("orders")
                        .doc(value.id)
                        .collection("products")
                        .add({
                      "name": doc.get("name"),
                      "ngo": doc.get("ngo"),
                      "companyShare": doc.get("companyShares"),
                      "price": doc.get("price"),
                      "imgUrl": doc.get("imgUrl"),
                    });
                  }
                });

                Navigator.of(context).pop();
                await _confirmDialog();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 5), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          title: Text('Thanks for ordering'),
          content: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: <Widget>[
                Text('You can collect your order from HR'),
              ],
            ),
          ),
        );
      },
    );
  }

  int price = 0;
  int companyPay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(_authService.returnCurrentUserid())
              .collection("cart")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.data!.docs.length == 0) {
              return Center(child: Text("Your cart is empty"));
            } else {
              for (DocumentSnapshot doc in snapshot.data!.docs) {
                int priceCurrent = doc.get("price");
                price += priceCurrent;
                int companyPayCurrent =
                    doc.get("price") * doc.get("companyShares") / 100;
                companyPay += companyPayCurrent;
              }
              return Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Product Details',
                          style: TextStyle(
                            fontSize: 36,
                            color: Color.fromARGB(255, 42, 67, 101),
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 226, 232, 240),
                          thickness: 2,
                        ),
                        ListView.builder(
                          itemBuilder: (context, index) => ProductItemViews(
                              snapshot: snapshot.data!.docs[index]),
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 400,
                            height: 200,
                            color: Color.fromRGBO(218, 235, 247, 1),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " Price You pay:",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Text(
                                        "Rs " + price.toString(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " Company pays:",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Text(
                                        "Rs " + companyPay.toString(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " NGO gets",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Text(
                                        "Rs " + (price + companyPay).toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                  StreamBuilder<DocumentSnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection("Users")
                                          .doc(_authService
                                              .returnCurrentUserid())
                                          .snapshots(),
                                      builder: (context, users) {
                                        if (users.data == null)
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        return Center(
                                          child: ElevatedButton.icon(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color.fromRGBO(
                                                            45, 55, 72, 1)),
                                              ),
                                              onPressed: () {
                                                _showMyDialog(
                                                    users.data!
                                                        .get("displayName"),
                                                    users.data!.get("empcode"),
                                                    snapshot.data!.docs);
                                              },
                                              icon:
                                                  Icon(Icons.payment_outlined),
                                              label: Text("Pay")),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}

class ProductItemViews extends StatelessWidget {
  final QueryDocumentSnapshot snapshot;
  const ProductItemViews({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 80,
        width: 1400,
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
                  child: Image(
                    image: NetworkImage(
                      snapshot['imgUrl'],
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(snapshot["name"],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Company Shares " +
                            snapshot.get("companyShares").toString() +
                            "%",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        )),
                  ],
                ),
              ],
            ),
            // Row(
            //   children: [
            //     IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
            //     Container(
            //       decoration: BoxDecoration(
            //         border: Border.all(
            //           color: Colors.grey,
            //           width: 1,
            //         ),
            //       ),
            //       padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            //       child: Text("2"),
            //     ),
            //     IconButton(onPressed: () {}, icon: Icon(Icons.add))
            //   ],
            // ),
            // Text(
            //   "99",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            Text(
              "Rs " + snapshot.get("price").toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ElevatedButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink),
                ),
                icon: Icon(Icons.delete),
                label: Text("Remove")),
          ],
        ),
      ),
    );
  }
}
