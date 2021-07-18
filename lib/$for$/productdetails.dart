import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'cart.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:like_button/like_button.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  final ScrollController _controllerOne = ScrollController();
  bool pressAttention = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
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
              Icon(Icons.shopping_cart),
            ],
          ),
          Column(
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
                    child: Image.asset("product2.jpeg"),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(" Product Name",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              )),
                          Text("Cost",
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
                                color: isLiked ? Colors.red : Colors.grey,
                              );
                            },
                          ),
                          ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(45, 55, 72, 1)),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Cart()));
                              },
                              icon: Icon(Icons.shopping_bag),
                              label: Text("Add to cart")),
                          SizedBox(height: 90),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                    children: [
                      Column(
                        children: [
                          Text(" NGO by:",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text(" Product Description",
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
                          Text("Company Shares",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Buys",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              )),
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
                child: Scrollbar(
                  isAlwaysShown: true,
                  controller: _controllerOne,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView.builder(
                        controller: _controllerOne,
                        itemCount: numItems,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {}, child: ItemCard());
                        }),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      width: 340,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        border: Border.all(color: Color.fromARGB(255, 204, 204, 204), width: 1),
        // image: DecorationImage(image: AssetImage('product.jpg'),
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'product1.jpeg',
                  width: 121,
                  height: 81,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      'Product Name',
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 55, 72),
                          fontSize: 24,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$4.99',
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 55, 72),
                          fontSize: 24,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Product Description lorem ipsum',
              style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 113, 128, 150)),
            ),
          ],
        ),
      ),
    );
  }
}
