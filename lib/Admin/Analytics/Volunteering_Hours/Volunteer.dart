import 'package:flutter/material.dart';

class Volunteer extends StatefulWidget {
  Volunteer({Key? key}) : super(key: key);

  @override
  _VolunteerState createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {
  static const int numItems = 20;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  int _rating = 0;

  bool star = false;

  void rate(int rating) {
    //Other actions based on rating such as api calls.
    setState(() {
      _rating = rating;
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Do you want to delete the file?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                print('Confirmed');
                Navigator.of(context).pop();
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

  String _searchText = "";
  final myController = TextEditingController();
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  var date;

  void initState() {
    date = DateTime.now();

    super.initState();

    myController.addListener(() {
      setState(() {
        _searchText = myController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Volunteer',
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
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Core Team',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 44, 82, 130),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 150,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextField(
                                controller: myController,
                                decoration: InputDecoration(
                                  // labelText: "Search",
                                  hintText: "Search ",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 113, 128, 150))),
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 204, 204, 204),
                                  ),
                                  focusColor:
                                      Color.fromARGB(255, 204, 204, 204),
                                  fillColor: Color.fromARGB(255, 204, 204, 204),
                                  suffixIcon: _searchText.isNotEmpty
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.clear,
                                            color: Color.fromARGB(
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
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Color.fromARGB(255, 204, 204, 204),
                          width: 1,
                        )),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                child: DataTable(
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Text('Name',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 44, 82, 130),
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text('Department',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Rate',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Action',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                    numItems,
                                    (int index) => DataRow(
                                      color: MaterialStateProperty.resolveWith<
                                          Color?>((Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          return Color.fromARGB(
                                                  255, 237, 242, 247)
                                              .withOpacity(0.08);
                                        }
                                        if (index.isEven) {
                                          return Color.fromARGB(
                                              255, 237, 242, 247);
                                        }
                                        return null;
                                      }),
                                      cells: <DataCell>[
                                        DataCell(Text('abc')),
                                        DataCell(Text('abc')),
                                        DataCell(
                                          new GestureDetector(
                                            child: new Icon(
                                              Icons.star,
                                              color: _rating >= 1
                                                  ? Colors.orange
                                                  : Colors.grey,
                                            ),
                                            onTap: () => rate(1),
                                          ),
                                        ),
                                        DataCell(
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                            ),
                                            onPressed: () {
                                              _showMyDialog();
                                            },
                                          ),
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
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Volunteers',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 44, 82, 130),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 150,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextField(
                                controller: myController,
                                decoration: InputDecoration(
                                  // labelText: "Search",
                                  hintText: "Search ",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 113, 128, 150))),
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 204, 204, 204),
                                  ),
                                  focusColor:
                                      Color.fromARGB(255, 204, 204, 204),
                                  fillColor: Color.fromARGB(255, 204, 204, 204),
                                  suffixIcon: _searchText.isNotEmpty
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.clear,
                                            color: Color.fromARGB(
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
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Color.fromARGB(255, 204, 204, 204),
                          width: 1,
                        )),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                child: DataTable(
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Text('Name',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 44, 82, 130),
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text('Department',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Rate',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Action',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 44, 82, 130),
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                    numItems,
                                    (int index) => DataRow(
                                      color: MaterialStateProperty.resolveWith<
                                          Color?>((Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          return Color.fromARGB(
                                                  255, 237, 242, 247)
                                              .withOpacity(0.08);
                                        }
                                        if (index.isEven) {
                                          return Color.fromARGB(
                                              255, 237, 242, 247);
                                        }
                                        return null;
                                      }),
                                      cells: <DataCell>[
                                        DataCell(Text('abc')),
                                        DataCell(Text('abc')),
                                        DataCell(
                                          new GestureDetector(
                                            child: new Icon(
                                              Icons.star,
                                              color: _rating >= 1
                                                  ? Colors.orange
                                                  : Colors.grey,
                                            ),
                                            onTap: () => rate(1),
                                          ),
                                        ),
                                        DataCell(
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                            ),
                                            onPressed: () {
                                              _showMyDialog();
                                            },
                                          ),
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
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
