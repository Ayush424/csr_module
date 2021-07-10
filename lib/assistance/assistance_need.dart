import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Theme/colors.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class AssistanceNeed extends StatefulWidget {
  @override
  State<AssistanceNeed> createState() => _AssistanceNeedState();
}

class _AssistanceNeedState extends State<AssistanceNeed> {
  final AuthService _authService = AuthService();
  TextEditingController textController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  String dropdownvalue = "Select Category";

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

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Wrap(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "Assistance - I Need",
                  style: TextStyle(
                      fontSize: 36, color: Color.fromARGB(255, 45, 55, 72)),
                ),
                const Divider(
                  thickness: 3,
                  color: Color.fromARGB(255, 237, 242, 247),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(
                          "Category",
                          style: TextStyle(
                              color: darkblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        child: TextField(
                          controller: categoryController,
                          minLines: 1,
                          maxLines: 2,
                        ),
                        height: 100,
                      ),
                      // DropdownButton(
                      //     focusColor: darkblue,
                      //     value: dropdownvalue,
                      //     onChanged: (String? newValue) {
                      //       setState(() {
                      //         dropdownvalue = newValue!;
                      //       });
                      //     },
                      //     items: <String>["Select Category", "1", "2", "3"]
                      //         .map<DropdownMenuItem<String>>((String value) {
                      //       return DropdownMenuItem<String>(
                      //         value: value,
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(5),
                      //           child: Text(value),
                      //         ),
                      //       );
                      //     }).toList()),
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          "Content",
                          style: TextStyle(
                              color: darkblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        child: TextField(
                          controller: textController,
                          minLines: 5,
                          maxLines: 10,
                        ),
                        height: 200,
                      ),
                      Center(
                        child: GestureDetector(
                            child: Chip(
                              backgroundColor: darkblue,
                              label: Text(
                                "Post",
                                style: TextStyle(color: Colors.white),
                              ),
                              avatar: Icon(
                                Icons.post_add,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              final Map<String, dynamic> entry = {
                                'category': categoryController.text,
                                'content': textController.text,
                                'date': Timestamp.now(),
                                'postedBy':
                                    _authService.returnCurrentUserEmail()
                              };

                              if (categoryController.text.isNotEmpty &&
                                  textController.text.isNotEmpty) {
                                FirebaseFirestore.instance
                                    .collection('assistance')
                                    .add(entry)
                                    .then(
                                      (result) => showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          content: SizedBox(
                                            height: 150,
                                            child: Center(
                                              child: Text(
                                                'Posted Successfully',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          content: Text(
                                            'Please fill all the fields',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.red),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ));
                              }
                            }),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Assistence Posted",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 42, 67, 101),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all((10)),
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color.fromARGB(255, 237, 242, 247),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Flexible(
                            child: DataTable(
                              columns: [
                                DataColumn(label: Text('DOCUMENT')),
                                DataColumn(label: Text('TYPE')),
                                DataColumn(label: Text('ACTION')),
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(Text("zxdcfvgbhnjmkuyyyyuu")),
                                    DataCell(Text('doc')),
                                    DataCell(
                                      ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.change_circle,
                                          size: 24.0,
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color.fromRGBO(
                                                      255, 75, 162, 1)),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.all(10)),
                                        ),
                                        label: Text(
                                          'Mark as completed',
                                          maxLines: 2,
                                        ),
                                        onPressed: () {
                                          _showMyDialog();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
