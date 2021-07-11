import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'cart.dart';
import 'package:dots_indicator/dots_indicator.dart';

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
            mainAxisAlignment: MainAxisAlignment.start,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(" Product Name",
                          style: TextStyle(
                            fontSize: 20,
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
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.favorite_outline),
                        // IconButton(
                        //     color: pressAttention ? Colors.grey : Colors.blue,
                        //     onPressed: () {
                        //       setState(() {
                        //         pressAttention = !pressAttention;
                        //       });
                        //     },
                        //     icon: Icon(Icons.favorite_border)),
                        SizedBox(width: 20),
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 90),
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
