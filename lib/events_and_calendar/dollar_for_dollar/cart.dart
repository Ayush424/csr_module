

import 'productdetails.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: LeftView()),
          RightView(),
        ],
      ),
    );
  }
}

class RightView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: Color.fromRGBO(218, 235, 247, 1),
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Text("Order Summary", style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            height: 1.0,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Items 3",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 44, 82, 130),
                  fontSize: 15,
                ),
              ),
              Text(
                "6000",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 44, 82, 130),
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            "VAT",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: [
                    DropdownMenuItem(
                      child: Text("Standard Delivery"),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            "GST",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextField(
              controller: TextEditingController(text: "Enter your code"),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: InputBorder.none,
                  hintText: "Enter your Code",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  suffixIcon: Icon(Icons.keyboard_arrow_down)),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 44, 82, 130),
                  ),
                ),
                child: Text("Confirm")),
          ),
        ],
      ),
    );
  }
}

class LeftView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 44, 82, 130),
      fontSize: 18,
    );
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 44, 82, 130),
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              height: 1.0,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product Details",
                  style: textStyle,
                ),
                Text(
                  "Quantity",
                  style: textStyle,
                ),
                Text(
                  "Price",
                  style: textStyle,
                ),
                Text(
                  "Total",
                  style: textStyle,
                ),
              ],
            ),
            ListView.builder(
              itemBuilder: (context, index) => ProductItemViews(),
              itemCount: 3,
              shrinkWrap: true,
            ),
            Spacer(),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetails()));
                },
                icon: Icon(Icons.keyboard_arrow_left),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 44, 82, 130),
                  ),
                ),
                label: Text("Continue Shopping")),
          ],
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
    return Container(
      height: 80,
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
                  Text(
                    "Product 1",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Product 1",
                    style: TextStyle(color: Colors.orange),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      icon: Icon(Icons.delete),
                      label: Text("Remove"))
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
          )
        ],
      ),
    );
  }
}
