// import 'dart:io';

import 'dart:html';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class HomeDocuments extends StatefulWidget {
  const HomeDocuments({Key? key}) : super(key: key);

  @override
  _HomeDocumentsState createState() => _HomeDocumentsState();
}

class _HomeDocumentsState extends State<HomeDocuments> {
  @override
  void dispose() {
    _textFieldController.dispose();

    super.dispose();
  }

  final TextEditingController _textFieldController = TextEditingController();
  final AuthService _authService = AuthService();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  //UploadTask uploadedTask;

  void _uploadDocuments() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;
      String? id = _authService.returnCurrentUserid();
      // Upload file
      UploadTask task =
          _firebaseStorage.ref('$id/$fileName').putData(fileBytes);
      String url = await (await task).ref.getDownloadURL();
      DocumentSnapshot<Map<String, dynamic>> data = await _firebaseFirestore
          .collection('Users')
          .doc(_authService.returnCurrentUserid())
          .get();
      Map<String, dynamic> documents = data['documents'];
      documents.putIfAbsent(fileName, () => url);
      _firebaseFirestore
          .collection('Users')
          .doc(_authService.returnCurrentUserid())
          .update({'documents': documents});
    }
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter Text'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text('Edit'),
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
                // print('Confirmed');
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
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 780,
                    height: 180,
                    decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 237, 242, 247),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _uploadDocuments();
                            },
                            label: Text('Upload'),
                            icon: Icon(Icons.upload_sharp),
                            style: ButtonStyle(
                              fixedSize:
                                  MaterialStateProperty.all(Size(150, 40)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Select Document",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Uploaded Documents",
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
                      width: 780,
                      decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 237, 242, 247),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('DOCUMENT')),
                          DataColumn(label: Text('TYPE')),
                          DataColumn(label: Text('ACTION')),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Wrap(
                              spacing: 10,
                              children: [
                                Text('1'),
                                IconButton(
                                  icon: Icon(
                                    Icons.drive_file_rename_outline,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    _displayDialog(context);
                                  },
                                ),
                              ],
                            )),
                            DataCell(Text('doc')),
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
                          ]),
                          DataRow(cells: [
                            DataCell(Wrap(
                              spacing: 10,
                              children: [
                                Text('1'),
                                IconButton(
                                  icon: Icon(
                                    Icons.drive_file_rename_outline,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    _displayDialog(context);
                                  },
                                ),
                              ],
                            )),
                            DataCell(Text("pdf")),
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
                          ]),
                          DataRow(cells: [
                            DataCell(Wrap(
                              spacing: 10,
                              children: [
                                Text('1'),
                                IconButton(
                                  icon: Icon(
                                    Icons.drive_file_rename_outline,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    _displayDialog(context);
                                  },
                                ),
                              ],
                            )),
                            DataCell(Text('img')),
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
                          ]),
                          DataRow(cells: [
                            DataCell(Wrap(
                              spacing: 10,
                              children: [
                                Text('1'),
                                IconButton(
                                  icon: Icon(
                                    Icons.drive_file_rename_outline,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    _displayDialog(context);
                                  },
                                ),
                              ],
                            )),
                            DataCell(Text("img")),
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
                          ]),
                          DataRow(cells: [
                            DataCell(Wrap(
                              spacing: 10,
                              children: [
                                Text('1'),
                                IconButton(
                                  icon: Icon(
                                    Icons.drive_file_rename_outline,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    _displayDialog(context);
                                  },
                                ),
                              ],
                            )),
                            DataCell(Text('pdf')),
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
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
