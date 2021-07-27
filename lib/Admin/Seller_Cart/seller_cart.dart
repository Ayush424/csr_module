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
                  fontSize: 28, color: Color.fromARGB(255, 42, 67, 101)),
            ),
          ),
          Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              height: 210,
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 85,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('Employee Code',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      DataColumn(
                        label: Text('Name ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      DataColumn(
                        label: Text('Order Date',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      DataColumn(
                        label: Text('Amount',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      numItems,
                      (int index) => DataRow(
                        color: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return Color.fromARGB(255, 237, 242, 247)
                                .withOpacity(0.08);
                          }
                          if (index.isEven) {
                            return Color.fromARGB(255, 237, 242, 247);
                          }
                          return null;
                        }),
                        cells: <DataCell>[
                          DataCell(
                            Text('Emp Code'),
                          ),
                          DataCell(
                            Text('Name'),
                          ),
                          DataCell(
                            Text(
                              'June 27,2021',
                            ),
                          ),
                          DataCell(
                            Text(
                              'Total Amount',
                            ),
                          ),
                          DataCell(
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(44, 82, 130, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => SellerCartDialogue());
                                },
                                child: Text(
                                  'View Order',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 252, 254, 1)),
                                )),
                          ),
                          DataCell(
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.pink,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                                onPressed: () {},
                                child: Text(
                                  'Mark as Delivered',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 50,
          ),
          ListTile(
            title: Text(
              'Completed Orders',
              style: TextStyle(
                  fontSize: 28, color: Color.fromARGB(255, 42, 67, 101)),
            ),
          ),
          Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              height: 210,
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 95,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('Emp Code',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      DataColumn(
                        label: Text('Name ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      DataColumn(
                        label: Text('Order Date',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      DataColumn(
                        label: Text('Delievery Date',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      DataColumn(
                        label: Text('Total Amount',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      numItems,
                      (int index) => DataRow(
                        color: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return Color.fromARGB(255, 237, 242, 247)
                                .withOpacity(0.08);
                          }
                          if (index.isEven) {
                            return Color.fromARGB(255, 237, 242, 247);
                          }
                          return null;
                        }),
                        cells: <DataCell>[
                          DataCell(
                            Text('Emp Code'),
                          ),
                          DataCell(
                            Text('Name'),
                          ),
                          DataCell(
                            Text(
                              'June 27,2021',
                            ),
                          ),
                          DataCell(
                            Text(
                              'June 30,2021',
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                '500',
                              ),
                            ),
                          ),
                          DataCell(
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(44, 82, 130, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => SellerCartDialogue());
                                },
                                child: Text(
                                  'View Order',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 252, 254, 1)),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
