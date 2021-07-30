import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  _displayDialog(BuildContext context, String details, String field) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter" + details),
            content: TextField(
              decoration: InputDecoration(hintText: "Changed Value"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text('Save'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(45, 55, 72, 1)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
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
                  'Settings',
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
                Wrap(
                  spacing: 90,
                  runSpacing: 90,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Wrap(
                        children: [
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color.fromARGB(255, 204, 204, 204),
                              width: 1,
                            )),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                width: 800,
                                child: DataTable(columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text('Fields',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Entry',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Action',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                        )),
                                  ),
                                ], rows: [
                                  DataRow(cells: [
                                    DataCell(Text('Organization Name')),
                                    DataCell(Text("Lorem_ipsum")),
                                    DataCell(
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () {
                                          _displayDialog(context,
                                              " new Organization Name", "Name");
                                        },
                                      ),
                                    ),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('GST Number')),
                                    DataCell(Text("Lorem_ipsum")),
                                    DataCell(
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () {
                                          _displayDialog(context,
                                              " new GST Number", "Number");
                                        },
                                      ),
                                    ),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('PAN Number')),
                                    DataCell(Text("Lorem_ipsum")),
                                    DataCell(
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () {
                                          _displayDialog(context,
                                              " new PAN Number", "Name");
                                        },
                                      ),
                                    ),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('Phone No.')),
                                    DataCell(Text("Lorem_ipsum")),
                                    DataCell(
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () {
                                          _displayDialog(context,
                                              " new Phone No.", "Name");
                                        },
                                      ),
                                    ),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('Email Id')),
                                    DataCell(Text("Lorem_ipsum")),
                                    DataCell(
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () {
                                          _displayDialog(
                                              context, " new Email Id", "Name");
                                        },
                                      ),
                                    ),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('Website ')),
                                    DataCell(Text("Lorem_ipsum")),
                                    DataCell(
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () {
                                          _displayDialog(
                                              context, " new Website", "Name");
                                        },
                                      ),
                                    ),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('Domain')),
                                    DataCell(Text("Lorem_ipsum")),
                                    DataCell(
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () {
                                          _displayDialog(
                                              context, " new Domain", "Name");
                                        },
                                      ),
                                    ),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('Address')),
                                    DataCell(Text("Lorem_ipsum")),
                                    DataCell(
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () {
                                          _displayDialog(
                                              context, " new Address", "Name");
                                        },
                                      ),
                                    ),
                                  ]),
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 60,
                            backgroundImage: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/csrmanagement-a6a16.appspot.com/o/blank-profile-picture-973460_1280.png?alt=media&token=733e7008-60af-48d8-9c86-d09b3e0e2152',
                            ),
                            child: Center(
                              child: TextButton(
                                child: Text(
                                  "Upload image",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Company Name",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
