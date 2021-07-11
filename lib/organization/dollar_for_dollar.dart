import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DollarForDollar extends StatefulWidget {
  const DollarForDollar({Key? key}) : super(key: key);

  @override
  _DollarForDollarState createState() => _DollarForDollarState();
}

class _DollarForDollarState extends State<DollarForDollar> {
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  String _searchText = "";
  final myController = TextEditingController();
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();

    myController.addListener(() {
      setState(() {
        _searchText = myController.text;
      });
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(100),
                  child: Container(
                    margin: EdgeInsets.only(left: 275),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(
                          255,
                          237,
                          242,
                          247,
                        ),
                        border: Border.all(
                          color: Color.fromARGB(255, 204, 204, 204),
                          width: 1,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search Using',
                          style: TextStyle(
                              color: Color.fromARGB(255, 113, 128, 150),
                              fontSize: 24,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Color.fromARGB(255, 44, 82, 130);
                                });
                              },
                              child: Icon(
                                Icons.check_circle_outline,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all(CircleBorder()),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(4)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.white), // <-- Button color
                                // overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                                //   if (states.contains(MaterialState.pressed)) return Colors.blue; // <-- Splash color
                                //     }),
                              ),
                            ),
                            Text(
                              'NGO Name',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 42, 67, 101),
                                  fontSize: 28,
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Color.fromARGB(255, 44, 82, 130);
                                });
                              },
                              child: Icon(
                                Icons.check_circle_outline,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all(CircleBorder()),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(4)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.white), // <-- Button color
                                // overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                                //   if (states.contains(MaterialState.pressed)) return Colors.blue; // <-- Splash color
                                //     }),
                              ),
                            ),
                            Text(
                              'Product Name',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 42, 67, 101),
                                  fontSize: 28,
                                  decoration: TextDecoration.none),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Apply',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(
                              255,
                              45,
                              55,
                              72,
                            )))
                      ],
                    ),
                  ),
                ),
              ]);
        });
  }

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
                  padding: EdgeInsets.only(left: 150, top: 10),
                  child: Wrap(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        width: 232,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Color.fromARGB(255, 204, 204, 204),
                          width: 1,
                        )),
                        child: TextField(
                          controller: myController,
                          decoration: InputDecoration(
                            // labelText: "Search",
                            hintText: "Search",
                            focusColor: Color.fromARGB(255, 204, 204, 204),
                            fillColor: Color.fromARGB(255, 204, 204, 204),
                            prefixIcon: _searchText.isNotEmpty
                                ? IconButton(
                                    icon: Icon(
                                      Icons.clear,
                                      color: Color.fromARGB(255, 204, 204, 204),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        myController.clear();
                                      });
                                    },
                                  )
                                : IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      color: Color.fromARGB(255, 204, 204, 204),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Color.fromARGB(255, 204, 204, 204);
                                        // myController.search();
                                      });
                                    },
                                  ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _showMyDialog();
                                },
                                icon: Icon(Icons.filter_alt)),
                          ),
                        ),
                      ),
                    ],
                  ),
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
  final ScrollController _controllerOne = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Text(
              'Ngo Name',
              style: TextStyle(
                  color: Color.fromARGB(255, 45, 55, 72), fontSize: 22),
            ),
          ),
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
                      return ItemCard();
                    }),
              ),
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
