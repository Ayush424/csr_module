import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { ngo, product }

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

  SingingCharacter? _character = SingingCharacter.ngo;

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
                            focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(255, 113, 128, 150))
                                ),
                                hintStyle: TextStyle(
                                color:Color.fromARGB(255, 204, 204, 204),),
                            focusColor: Color.fromARGB(255, 204, 204, 204),
                            fillColor: Color.fromARGB(255, 204, 204, 204),
                            prefixIcon: _searchText.isNotEmpty
                                ? IconButton(
                                    icon: Icon(
                                      Icons.clear,
                                      color:Color.fromARGB(
                                              255, 113, 128, 150),
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
                                      color: Color.fromARGB(
                                              255, 113, 128, 150),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Color.fromARGB(
                                              255, 113, 128, 150);
                                        // myController.search();
                                      });
                                    },
                                  ),
                            suffixIcon: IconButton(
                                onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                          'Search Using',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 113, 128, 150),
                                              fontSize: 24,
                                              decoration: TextDecoration.none),
                                        ),
                                        // content: const Text('AlertDialog description'),
                                        actions: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, right: 2),
                                                child: Radio<SingingCharacter>(
                                                  value: SingingCharacter.ngo,
                                                  groupValue: _character,
                                                  onChanged: (SingingCharacter?
                                                      value) {
                                                    setState(() {
                                                      _character = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              Text(
                                                'NGO Name',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 42, 67, 101),
                                                    fontSize: 28,
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 2),
                                                child: Radio<SingingCharacter>(
                                                  value:
                                                      SingingCharacter.product,
                                                  groupValue: _character,
                                                  onChanged: (SingingCharacter?
                                                      value) {
                                                    setState(() {
                                                      _character = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              Text(
                                                'Product Name',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 42, 67, 101),
                                                    fontSize: 28,
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10, bottom: 10),
                                            child: ElevatedButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Apply'),
                                                child: Text(
                                                  'Apply',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                  255,
                                                  45,
                                                  55,
                                                  72,
                                                ))),
                                          )
                                        ],
                                      ),
                                    ),
                                icon: Icon(Icons.filter_alt)),
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
                                    data: snapshot.data!.docs[index], id: id);
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
  final String id;
  final QueryDocumentSnapshot<Object?> data;
  const NgoList({Key? key, required this.data, required this.id})
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
        color: Color.fromARGB(255,237, 242, 247),
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
