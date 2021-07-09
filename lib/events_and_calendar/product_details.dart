import "package:flutter/material.dart";

class ProductDetails extends StatefulWidget {
  ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Text(
              'Organization',
              style: TextStyle(
                fontSize: 36,
                color: Color.fromARGB(255, 42, 67, 101),
                decoration: TextDecoration.none,
              ),
            ),
            Icon(Icons.shopping_cart),
          ],
        ),
      ],
    );
  }
}
