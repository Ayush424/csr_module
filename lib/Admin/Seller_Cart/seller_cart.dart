import 'package:csr_module/Admin/seller_cart/seller_cart_dialoguebox.dart';
import 'package:flutter/material.dart';

class SellerCart extends StatefulWidget {
  const SellerCart({Key? key}) : super(key: key);

  @override
  _SellerCartState createState() => _SellerCartState();
}

class _SellerCartState extends State<SellerCart> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: ListView(
        controller: ScrollController(),
        children: [
          ListTile(
            title: Text(
              'Seller Cart',
              style: TextStyle(
                  fontSize: 36, color: Color.fromARGB(255, 42, 67, 101)),
            ),
          ),
          Divider(
            thickness: 3,
            color: Color.fromARGB(255, 237, 242, 247),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            title: Text(
              'Pending Orders',
              style: TextStyle(
                  fontSize: 22, color: Color.fromARGB(255, 42, 67, 101)),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: SizedBox(
              height: 210,
              child: ListView.builder(
                  controller: ScrollController(),
                  itemCount: numItems,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return PendingItemCard(numItems: 10);
                  }),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ListTile(
            title: Text(
              'Completed Orders',
              style: TextStyle(
                  fontSize: 22, color: Color.fromARGB(255, 42, 67, 101)),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: SizedBox(
              height: 210,
              child: ListView.builder(
                  controller: ScrollController(),
                  itemCount: numItems,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return CompletedItemCard(numItems: 10);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class PendingItemCard extends StatelessWidget {
  const PendingItemCard({
    Key? key,
    required this.numItems,
  }) : super(key: key);
  final int numItems;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text('Emp Code',
                  style: TextStyle(
                      color: Color.fromRGBO(42, 67, 101, 1),
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text('Name',
                  style: TextStyle(
                      color: Color.fromRGBO(42, 67, 101, 1),
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text('Order Date:June 27,2021',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text('Total Amount',
                  style: TextStyle(
                      color: Color.fromRGBO(42, 67, 101, 1),
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(44, 82, 130, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {
                    showDialog(
                        context: context, builder: (_) => SellerCartDialogue());
                  },
                  child: Text(
                    'View Order',
                    style: TextStyle(color: Color.fromRGBO(255, 252, 254, 1)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Mark as Delivered',
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class CompletedItemCard extends StatelessWidget {
  const CompletedItemCard({
    Key? key,
    required this.numItems,
  }) : super(key: key);
  final int numItems;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text('Emp Code',
                  style: TextStyle(
                      color: Color.fromRGBO(42, 67, 101, 1),
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text('Name',
                  style: TextStyle(
                      color: Color.fromRGBO(42, 67, 101, 1),
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text('Order Date:June 27,2021',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text('Delivery Date',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text('Total Amount',
                  style: TextStyle(
                      color: Color.fromRGBO(42, 67, 101, 1),
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(44, 82, 130, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {
                    showDialog(
                        context: context, builder: (_) => SellerCartDialogue());
                  },
                  child: Text(
                    'View Order',
                    style: TextStyle(color: Color.fromRGBO(255, 252, 254, 1)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
