import 'package:flutter/material.dart';

class SellerCartDialogue extends StatefulWidget {
  const SellerCartDialogue({Key? key}) : super(key: key);

  @override
  _SellerCartDialogueState createState() => _SellerCartDialogueState();
}

class _SellerCartDialogueState extends State<SellerCartDialogue> {
  static const int numitems = 10;
  List<bool> selected = List<bool>.generate(numitems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 237, 242, 247),
      content: Container(
        color: const Color.fromARGB(255, 237, 242, 247),
        height: screensize.height * 0.7,
        width: screensize.width * 0.6,
        child: ListView(
          shrinkWrap: true,
          controller: ScrollController(),
          physics: ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: screensize.height * 0.45,
              width: screensize.width * 0.6,
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 50,
                    dataRowHeight: 80,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(''),
                      ),
                      DataColumn(
                        label: Text('Product Name',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                      DataColumn(
                        label: Text('Company Shares ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                      DataColumn(
                        label: Text('Quantity',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                      DataColumn(
                        label: Text('Amount',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 82, 130),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      numitems,
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
                            SizedBox(
                              height: 60,
                              width: 100,
                              child: Image.asset(
                                'product.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          DataCell(
                            Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Flexible(
                                  child: Text('Product Name',
                                      style: TextStyle(
                                          color: Color.fromRGBO(42, 67, 101, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Flexible(
                                  child: Text('Name of Organisation',
                                      style: TextStyle(
                                        color: Color.fromRGBO(42, 67, 101, 1),
                                      )),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text('50%',
                                  style: TextStyle(
                                      color: Color.fromRGBO(42, 67, 101, 1),
                                      fontSize: 18)),
                            ),
                          ),
                          DataCell(
                            Text('Qty.1',
                                style: TextStyle(
                                    color: Color.fromRGBO(42, 67, 101, 1),
                                    fontSize: 18)),
                          ),
                          DataCell(
                            Text('\$4.99',
                                style: TextStyle(
                                    color: Color.fromRGBO(42, 67, 101, 1),
                                    fontSize: 18)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                trailing: Text('Price: \$10.00',
                    style: TextStyle(
                        color: Color.fromRGBO(42, 67, 101, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                trailing: Text('Vat: \$0.01',
                    style: TextStyle(
                        color: Color.fromRGBO(42, 67, 101, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                trailing: Text('Gst: \$2.01',
                    style: TextStyle(
                        color: Color.fromRGBO(42, 67, 101, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                trailing: Text('Total: \$12.02',
                    style: TextStyle(
                        color: Color.fromRGBO(42, 67, 101, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogueItemCard extends StatelessWidget {
  const DialogueItemCard({
    Key? key,
    required this.numitems,
  }) : super(key: key);
  final int numitems;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: SizedBox(
                height: 60,
                width: 100,
                child: Image.asset(
                  'product.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Flexible(
                    child: Text('Product Name',
                        style: TextStyle(
                            color: Color.fromRGBO(42, 67, 101, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 24)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Text('Name of Organisation',
                        style:
                            TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Company shares: 50%',
                  style: TextStyle(color: Color.fromRGBO(42, 67, 101, 1))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text('Qty.1',
                  style: TextStyle(
                      color: Color.fromRGBO(42, 67, 101, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 10),
              child: Text('\$4.99',
                  style: TextStyle(
                      color: Color.fromRGBO(42, 67, 101, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
