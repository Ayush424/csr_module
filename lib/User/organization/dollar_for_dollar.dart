import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Theme/colors.dart';
import 'package:csr_module/User/dollarFordollar/product_details_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// enum SingingCharacter { ngo, product }

class DollarForDollar extends StatefulWidget {
  final ValueChanged<String>? update;
  const DollarForDollar({Key? key, this.update}) : super(key: key);

  @override
  _DollarForDollarState createState() => _DollarForDollarState();
}

class _DollarForDollarState extends State<DollarForDollar> {
  String dropdownValue = "Filter";
  bool select = false;
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  String _searchText = "";
  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    myController.addListener(() {
      setState(() {
        _searchText = myController.text;
      });
    });
  }

  // SingingCharacter? _character = SingingCharacter.ngo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            controller: ScrollController(),
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
                  padding: EdgeInsets.only(left: 70, top: 10),
                  child: Wrap(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        // width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Color.fromARGB(255, 204, 204, 204),
                          width: 1,
                        )),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            focusColor: Color.fromARGB(255, 113, 128, 150),
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                                select = true;
                              });
                            },
                            items: <String>[
                              "Filter",
                              "NGO Name",
                              "Product Name"
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(
                                    widthFactor: 1,
                                    heightFactor: 0.5,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(value))),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 19,
                      ),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('ngos')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null)
                          return CircularProgressIndicator();
                        else if (snapshot.data!.docs.length == 0) {
                          return Text('No ngo partners right now');
                        } else {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final id = snapshot.data!.docs[index].id;
                                return NgoList(
                                  data: snapshot.data!.docs[index],
                                  id: id,
                                  update: widget.update,
                                );
                              });
                        }
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
  final ValueChanged<String>? update;
  final String id;
  final QueryDocumentSnapshot<Object?> data;
  const NgoList({Key? key, required this.data, required this.id, this.update})
      : super(key: key);

  @override
  _NgoListState createState() => _NgoListState();
}

class _NgoListState extends State<NgoList> {
  // static const int numItems = 6;
  // List<bool> selected = List<bool>.generate(numItems, (int index) => false);
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
              widget.data['name'],
              style: TextStyle(
                  color: Color.fromARGB(255, 45, 55, 72), fontSize: 22),
            ),
          ),
          SizedBox(
            height: 200,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('ngos')
                    .doc(widget.id)
                    .collection('Products')
                    .snapshots(),
                builder: (context, snapshot2) {
                  if (snapshot2.data == null) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot2.data!.docs.isEmpty) {
                    return Text('no products to show');
                  } else {
                    return Scrollbar(
                      isAlwaysShown: true,
                      controller: _controllerOne,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: ListView.builder(
                            controller: _controllerOne,
                            itemCount: snapshot2.data!.docs.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  ProductDetailsManager.ngoId = snapshot2.data!
                                      .docs[index].reference.parent.parent!.id;
                                  ProductDetailsManager.productId =
                                      snapshot2.data!.docs[index].id;

                                  widget.update!("details");
                                },
                                child:
                                    ItemCard(data: snapshot2.data!.docs[index]),
                              );
                            }),
                      ),
                    );
                  }
                }),
          ),
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
      height: 200,
      width: 340,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: teal,
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
                SizedBox(
                  height: 50,
                  width: 110,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        data['product name'],
                        maxLines: 2,
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 55, 72),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
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
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                data['description'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 113, 128, 150)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
