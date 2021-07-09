import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DollarForDollar extends StatefulWidget {
  const DollarForDollar({Key? key}) : super(key: key);

  @override
  _DollarForDollarState createState() => _DollarForDollarState();
}

class _DollarForDollarState extends State<DollarForDollar> {
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ for \$",
                      style: TextStyle(
                          fontSize: 36,
                          color: Color.fromARGB(255, 42, 67, 101),
                          decoration: TextDecoration.none),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 80, bottom: 10),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Color.fromARGB(255, 45, 55, 72),
                            size: 40,
                          )),
                    ),
                  ],
                ),
                Divider(
                  color: Color.fromARGB(255, 226, 232, 240),
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: numItems,
                      itemBuilder: (context, index) {
                        return NgoList();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NgoList extends StatefulWidget {
  const NgoList({Key? key}) : super(key: key);

  @override
  _NgoListState createState() => _NgoListState();
}

class _NgoListState extends State<NgoList> {
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Ngo Name',
              style: TextStyle(
                  color: Color.fromARGB(255, 45, 55, 72), fontSize: 22),
            ),
          ),
          SizedBox(
            height: 200,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                IconButton(
                  onPressed: () => buttonCarouselController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear),
                  icon: Icon(Icons.arrow_left_sharp),
                  color: Color.fromARGB(255, 42, 67, 101),
                  iconSize: 50,
                ),
                CarouselSlider.builder(
                  // itemCount: numItems,
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    aspectRatio: 3.8,
                  ),
                  // itemCount: numItems.round(),
                  itemCount: (numItems / 3).round(),
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Row(children: [
                      Flexible(
                        child: ItemCard(),
                        flex: 1,
                      ),
                      Flexible(
                        child: ItemCard(),
                        flex: 1,
                      ),
                      //  Flexible(child: ItemCard(),
                      //  flex: 1,),
                    ]);
                  },
                ),
                IconButton(
                  onPressed: () => buttonCarouselController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear),
                  icon: Icon(Icons.arrow_right_sharp),
                  color: Color.fromARGB(255, 42, 67, 101),
                  iconSize: 50,
                ),
              ],
            ),
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
                  'product.jpg',
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
                          fontWeight: FontWeight.bold),
                    )
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
                  fontSize: 18, color: Color.fromARGB(255, 113, 128, 150)),
            )
          ],
        ),
      ),
    );
  }
}
