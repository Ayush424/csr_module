// import 'dart:io';

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Theme/colors.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  void _launchUrl(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
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
      DocumentSnapshot<Map<String, dynamic>> data =
          await _firebaseFirestore.collection('Users').doc(id).get();
      Map<String, dynamic> documents = data['documents'];
      documents.putIfAbsent(fileName, () => url);
      _firebaseFirestore
          .collection('Users')
          .doc(id)
          .update({'documents': documents});
    }
  }

  // _displayDialog(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Enter Text'),
  //           content: TextField(
  //             controller: _textFieldController,
  //             decoration: InputDecoration(hintText: "Enter"),
  //           ),
  //           actions: <Widget>[
  //             ElevatedButton(
  //               child: new Text('Edit'),
  //               style: ButtonStyle(
  //                 backgroundColor: MaterialStateProperty.all(
  //                     const Color.fromRGBO(45, 55, 72, 1)),
  //               ),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  Future<void> _showMyDialog(String key, String value) async {
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
              onPressed: () async {
                _firebaseStorage.refFromURL(value).delete();
                final document = await _firebaseFirestore
                    .collection('Users')
                    .doc(_authService.returnCurrentUserid())
                    .get();
                Map<String, dynamic> map = document['documents'];
                map.remove(key);
                _firebaseFirestore
                    .collection('Users')
                    .doc(_authService.returnCurrentUserid())
                    .update({'documents': map});
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
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: _firebaseFirestore
                              .collection('Users')
                              .doc(_authService.returnCurrentUserid())
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              if (snapshot.data!['documents'].length == 0) {
                                return Center(
                                    child: Text(
                                  "No documents added yet",
                                  style:
                                      TextStyle(color: lightblue, fontSize: 20),
                                ));
                              }
                              final List keyList =
                                  snapshot.data!['documents'].keys.toList();
                              final List valueList =
                                  snapshot.data!['documents'].values.toList();
                              return DataTable(
                                columns: [
                                  DataColumn(
                                      label: Text(
                                    'Document',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: lightblue),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Download',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: lightblue),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Action',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: lightblue),
                                  )),
                                ],
                                rows: List<DataRow>.generate(
                                  snapshot.data!['documents'].length,
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
                                      DataCell(Text(keyList[index])),
                                      DataCell(IconButton(
                                        color: darkblue,
                                        icon: Icon(Icons.download),
                                        onPressed: () {
                                          _launchUrl(valueList[index]);
                                        },
                                      )),
                                      DataCell(IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: darkblue,
                                        ),
                                        onPressed: () {
                                          _showMyDialog(
                                              keyList[index], valueList[index]);
                                        },
                                      )),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }),
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
