import 'dart:html';

import 'productdetails.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: SingleChildScrollView(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: SingleChildScrollView(
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
                  itemBuilder: (context, index) => ProductItemViews(),
                  itemCount: 3,
                  shrinkWrap: true,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 200,
                    height: 300,
                    color: Color.fromRGBO(218, 235, 247, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " Price:",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                "Rs 100",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " VAT:",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                "0.01",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " GST:",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                "2.01",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " Total:",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                "Rs 150",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(45, 55, 72, 1)),
                                ),
                                onPressed: () {
                                  _showMyDialog();
                                },
                                icon: Icon(Icons.payment_outlined),
                                label: Text("Pay")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductItemViews extends StatelessWidget {
  const ProductItemViews({
    Key? key,
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
                Container(
                  width: 60,
                  color: Colors.green.shade300,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Product Name",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Company Shares",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Buys",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        )),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                  child: Text("2"),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.add))
              ],
            ),
            Text(
              "99",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "99",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink),
                ),
                icon: Icon(Icons.delete),
                label: Text("Remove"))
          ],
        ),
      ),
    );
  }
}
