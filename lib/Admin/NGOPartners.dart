import 'package:flutter/material.dart';

class partners extends StatefulWidget {
  partners({Key? key}) : super(key: key);

  @override
  _partnersState createState() => _partnersState();
}

class _partnersState extends State<partners> {
  bool add = false;
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  final ScrollController _controllerOne = ScrollController();
  static final List<String> items = <String>[
    'Dropdown',
    '2',
    '3',
    '4',
    '5',
  ];
  String value = items.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Text(
                    'Analytics - NGO Partners',
                    style: TextStyle(
                      fontSize: 36,
                      color: Color.fromARGB(255, 42, 67, 101),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 15, 0, 0),
                    child: Text(
                      '>>>>Details',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 44, 82, 130),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Color.fromARGB(255, 226, 232, 240),
                thickness: 2,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Color.fromARGB(255, 237, 242, 247),
                width: 1500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Wrap(
                        spacing: 300,
                        runSpacing: 20,
                        children: [
                          Wrap(
                            spacing: 10,
                            children: [
                              Text(
                                "Name:",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Name ',
                                    hintText: 'Enter Name',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Text(
                                "Category:",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Category ',
                                    hintText: 'Enter Category',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 20,
                            children: [
                              Text(
                                "Email Id:",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email ',
                                    hintText: 'Enter Email Id',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black26,
                            thickness: .5,
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Text(
                                "Name of Contact Person:",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Name ',
                                    hintText: 'Enter Name',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Text(
                                "Contact No.:",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Number ',
                                    hintText: 'Enter Number',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Text(
                                "Address:",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Address ',
                                    hintText: 'Enter Address',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black26,
                            thickness: .5,
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Text(
                                "MoU Start Date:",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Date ',
                                    hintText: 'Enter Date',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Text(
                                " MoU End Date:",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Date ',
                                    hintText: 'Enter Date',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Text(
                                " MoU File:",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  //_uploadDocuments();
                                },
                                label: Text('Upload'),
                                icon: Icon(Icons.upload_sharp),
                                style: ButtonStyle(
                                  fixedSize:
                                      MaterialStateProperty.all(Size(150, 40)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(45, 55, 72, 1)),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black26,
                            thickness: .5,
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Text(
                                "Products Offered:",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Offered',
                                    hintText: 'Enter Product Offered',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Text(
                                "Website URL:",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'URL',
                                    hintText: 'Enter URL',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Text(
                                "Funds Committed:",
                                style: TextStyle(
                                  color: Color.fromRGBO(45, 55, 72, 1),
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Funds ',
                                    hintText: 'Enter Funds',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black26,
                      thickness: .5,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              Text("Products by NGO",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  )),
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
                          return GestureDetector(
                              onTap: () {}, child: ItemCard());
                        }),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.add,
                      size: 24.0,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(45, 55, 72, 1)),
                    ),
                    label: Text('Add New'),
                    onPressed: () {
                      setState(() {
                        add = true;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              add == true
                  ? Center(
                      child: Container(
                        height: 250,
                        decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 237, 242, 247),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(50, 50, 30, 50),
                          child: Wrap(
                            spacing: 250,
                            runSpacing: 30,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Upload images",
                                      style: TextStyle(
                                        color: Color.fromRGBO(45, 55, 72, 1),
                                        decoration: TextDecoration.none,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          //_uploadDocuments();
                                        },
                                        label: Text('Upload'),
                                        icon: Icon(Icons.upload_sharp),
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              Size(150, 40)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromRGBO(
                                                      45, 55, 72, 1)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product Name",
                                      style: TextStyle(
                                          color: Color.fromRGBO(45, 55, 72, 1),
                                          decoration: TextDecoration.none,
                                          fontSize: 15),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        height: 40,
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Name ',
                                            hintText: 'Enter Name',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "Category",
                                      style: TextStyle(
                                          color: Color.fromRGBO(45, 55, 72, 1),
                                          decoration: TextDecoration.none,
                                          fontSize: 15),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      child: DropdownButton<String>(
                                        value: value,
                                        items: items
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  child: Text(
                                                    item,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                  value: item,
                                                ))
                                            .toList(),
                                        onChanged: (value) => setState(() {
                                          this.value = value!;
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Column(
                                  children: [
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                          color: Color.fromRGBO(45, 55, 72, 1),
                                          decoration: TextDecoration.none,
                                          fontSize: 15),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        height: 40,
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Amount ',
                                            hintText: 'INR',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Column(
                                  children: [
                                    Text(
                                      "Company Shares",
                                      style: TextStyle(
                                          color: Color.fromRGBO(45, 55, 72, 1),
                                          decoration: TextDecoration.none,
                                          fontSize: 15),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      child: DropdownButton<String>(
                                        value: value,
                                        items: items
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  child: Text(
                                                    item,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                  value: item,
                                                ))
                                            .toList(),
                                        onChanged: (value) => setState(() {
                                          this.value = value!;
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Column(
                                  children: [
                                    Text(
                                      "Description",
                                      style: TextStyle(
                                          color: Color.fromRGBO(45, 55, 72, 1),
                                          decoration: TextDecoration.none,
                                          fontSize: 15),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        height: 40,
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Description ',
                                            hintText: 'Description',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Column(
                                  children: [
                                    Text(
                                      "Units",
                                      style: TextStyle(
                                          color: Color.fromRGBO(45, 55, 72, 1),
                                          decoration: TextDecoration.none,
                                          fontSize: 15),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        height: 40,
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Enter Units available ',
                                            hintText: 'Units',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromARGB(255, 42, 67, 101)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        add = false;
                                      });
                                    },
                                    child: const Text("Done")),
                              ),
                              add == false ? Text("Done") : Text(""),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text(""),
            ],
          ),
        ),
      )),
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
                          decoration: TextDecoration.none,
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
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                    ),
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
                  fontSize: 18,
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 113, 128, 150)),
            ),
          ],
        ),
      ),
    );
  }
}
