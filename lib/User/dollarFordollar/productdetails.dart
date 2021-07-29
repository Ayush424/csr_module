// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Theme/colors.dart';
import 'package:csr_module/User/dollarFordollar/product_details_manager.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'cart.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:like_button/like_button.dart';

class ProductDetails extends StatefulWidget {
  final ValueChanged<String>? update;
  ProductDetails({Key? key, this.update}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final AuthService _authService = AuthService();
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  final ScrollController _controllerOne = ScrollController();
  bool pressAttention = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
      child: ListView(
        controller: ScrollController(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Details',
                style: TextStyle(
                  fontSize: 36,
                  color: Color.fromARGB(255, 42, 67, 101),
                  decoration: TextDecoration.none,
                ),
              ),
              IconButton(
                  onPressed: () {
                    widget.update!("cart");
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Color.fromARGB(255, 45, 55, 72),
                    size: 40,
                  ))
            ],
          ),
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("ngos")
                  .doc(ProductDetailsManager.ngoId)
                  .collection("Products")
                  .doc(ProductDetailsManager.productId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Divider(
                        color: Color.fromARGB(255, 226, 232, 240),
                        thickness: 2,
                      ),
                      Container(
                        height: 300,
                        child: CarouselSlider(items: [
                          Container(
                            width: 300,
                            child: Image(
                              image: NetworkImage(
                                snapshot.data!.get("imgUrl"),
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ], options: CarouselOptions()),
                      ),
                      new DotsIndicator(
                        dotsCount: 8,
                        position: 1,
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Divider(
                          color: Color.fromARGB(255, 226, 232, 240),
                          thickness: 2,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!["product name"],
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      )),
                                  Text(
                                      "₹ " +
                                          snapshot.data!["product price"]
                                              .toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        decoration: TextDecoration.none,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  LikeButton(
                                    circleColor: CircleColor(
                                        start: Color(0xFFF44336),
                                        end: Color(0xFFF44336)),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.favorite,
                                        size: 30,
                                        color:
                                            isLiked ? Colors.red : Colors.grey,
                                      );
                                    },
                                  ),
                                  ElevatedButton.icon(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color.fromRGBO(
                                                    45, 55, 72, 1)),
                                      ),
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection("Users")
                                            .doc(_authService
                                                .returnCurrentUserid())
                                            .collection("cart")
                                            .add({
                                          "ngo": snapshot.data!["ngo"],
                                          "quantity": 1,
                                          "companyShares":
                                              snapshot.data!["companyShares"],
                                          "name":
                                              snapshot.data!["product name"],
                                          "price":
                                              snapshot.data!["product price"],
                                          "id": snapshot.data!["product id"],
                                          "imgUrl": snapshot.data!["imgUrl"]
                                        }).then(
                                          (result) => showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              content: SizedBox(
                                                height: 150,
                                                child: Center(
                                                  child: Text(
                                                    'Added to cart',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.shopping_bag),
                                      label: Text("Add to cart")),
                                  SizedBox(height: 90),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Divider(
                                      color: Color.fromARGB(255, 226, 232, 240),
                                      thickness: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(snapshot.data!.get("description"),
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(" Sold by: " + snapshot.data!.get("ngo"),
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: 200,
                              ),
                              Column(
                                children: [
                                  Text(
                                      "Company Shares " +
                                          snapshot.data!
                                              .get("companyShares")
                                              .toString() +
                                          "%",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // Text("Buys",
                                  //     style: TextStyle(
                                  //       fontSize: 15,
                                  //       color: Colors.black,
                                  //       decoration: TextDecoration.none,
                                  //     )),
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     IconButton(
                              //         onPressed: () {}, icon: Icon(Icons.remove)),
                              //     Container(
                              //       decoration: BoxDecoration(
                              //         border: Border.all(
                              //           color: Colors.grey,
                              //           width: 1,
                              //         ),
                              //       ),
                              //       padding: EdgeInsets.symmetric(
                              //           vertical: 4, horizontal: 5),
                              //       child: Text("2"),
                              //     ),
                              //     IconButton(onPressed: () {}, icon: Icon(Icons.add))
                              //   ],
                              // ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Divider(
                          color: Color.fromARGB(255, 226, 232, 240),
                          thickness: 2,
                        ),
                      ),
                      Text("Other Items by NGO",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            decoration: TextDecoration.none,
                          )),
                      SizedBox(
                        height: 200,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("ngos")
                                .doc(ProductDetailsManager.ngoId)
                                .collection("Products")
                                .snapshots(),
                            builder: (context, products) {
                              if (products.data == null) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return Scrollbar(
                                  isAlwaysShown: true,
                                  controller: _controllerOne,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: ListView.builder(
                                        controller: _controllerOne,
                                        itemCount: products.data!.docs.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                              onTap: () {
                                                ProductDetailsManager.ngoId =
                                                    products
                                                        .data!
                                                        .docs[index]
                                                        .reference
                                                        .parent
                                                        .parent!
                                                        .id;
                                                ProductDetailsManager
                                                        .productId =
                                                    products
                                                        .data!.docs[index].id;

                                                widget.update!("details");
                                              },
                                              child: ItemCard(
                                                data:
                                                    products.data!.docs[index],
                                              ));
                                        }),
                                  ),
                                );
                              }
                            }),
                      ),
                    ],
                  );
                }
              }),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> data;
  const ItemCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 400,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: teal,
        border: Border.all(color: Color.fromARGB(255, 204, 204, 204), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  width: 140,
                  child: Image(
                    image: NetworkImage(
                      data['imgUrl'],
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 230,
                      child: Center(
                        child: Text(
                          data['product name'],
                          maxLines: 2,
                          style: TextStyle(
                              color: Color.fromARGB(255, 45, 55, 72),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '₹' + data['product price'].toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 55, 72),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Comp. shares: 30%',
                    //       style: TextStyle(
                    //           fontSize: 10,
                    //           color: Color.fromARGB(255, 113, 128, 150)),
                    //     ),
                    //     SizedBox(width: 10),
                    //     Text(
                    //       'Buys: 2000 units',
                    //       style: TextStyle(
                    //           fontSize: 10,
                    //           color: Color.fromARGB(255, 113, 128, 150)),
                    //     )
                    //   ],
                    // ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              data['description'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 113, 128, 150)),
            ),
          ],
        ),
      ),
    );
  }
}
