import 'dart:html';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:csr_module/auth/services/firestore_service.dart';

class HomeProfile extends StatefulWidget {
  @override
  State<HomeProfile> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final AuthService _authService = AuthService();

  final collection = FirebaseFirestore.instance.collection("Users");

  final TextEditingController _textFieldController = TextEditingController();

  void _uploadImg() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;
      String? id = _authService.returnCurrentUserid();
      // Upload file
      UploadTask task =
          _firebaseStorage.ref('$id/profile/$fileName').putData(fileBytes);
      String url = await (await task).ref.getDownloadURL();
      FirestoreService(uId: _authService.returnCurrentUserid()).updateImg(url);
    }
  }

  _displayDialog(BuildContext context, String details, String field) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter" + details),
            content: TextField(
              controller: _textFieldController,
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
                  if (field == "phoneNo") {
                    FirestoreService(uId: _authService.returnCurrentUserid())
                        .updatePhone(_textFieldController.text);
                  }
                  if (field == "skypeId") {
                    FirestoreService(uId: _authService.returnCurrentUserid())
                        .updateSkype(_textFieldController.text);
                  }
                  if (field == "homeAddress") {
                    FirestoreService(uId: _authService.returnCurrentUserid())
                        .updateHome(_textFieldController.text);
                  }
                  if (field == "currentAddress") {
                    FirestoreService(uId: _authService.returnCurrentUserid())
                        .updateCurrent(_textFieldController.text);
                  }
                  if (field == "maritalStatus") {
                    FirestoreService(uId: _authService.returnCurrentUserid())
                        .updateMarital(_textFieldController.text);
                  }

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: collection.doc(_authService.returnCurrentUserid()).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null)
            return Center(child: CircularProgressIndicator());
          return Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: SizedBox(
              width: 900,
              child: Wrap(
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
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Entry',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Action',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                              ], rows: [
                                DataRow(cells: [
                                  DataCell(Text('Name')),
                                  DataCell(
                                      Text(snapshot.data!.get('displayName'))),
                                  DataCell(Text(" ")),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Emp_Code')),
                                  DataCell(Text(snapshot.data!.get('empcode'))),
                                  DataCell(Text(" ")),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Email')),
                                  DataCell(Text(snapshot.data!.get('email'))),
                                  DataCell(Text(" ")),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Date of Joining')),
                                  DataCell(Text(snapshot.data!
                                      .get('dateOfJoining')
                                      .toString())),
                                  DataCell(Text("")),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Phone Number')),
                                  DataCell(Text(snapshot.data!.get('phoneNo'))),
                                  DataCell(
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                      onPressed: () {
                                        _displayDialog(context,
                                            " new Phone Number", "phoneNo");
                                      },
                                    ),
                                  ),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('skype_id')),
                                  DataCell(Text(snapshot.data!.get('skypeId'))),
                                  DataCell(
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                      onPressed: () {
                                        _displayDialog(
                                            context, "new Skype_Id", "skypeId");
                                      },
                                    ),
                                  ),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Department')),
                                  DataCell(
                                      Text(snapshot.data!.get('department'))),
                                  DataCell(Text("")),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Gender')),
                                  DataCell(Text(snapshot.data!.get('gender'))),
                                  DataCell(
                                    Text(""),
                                  ),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Home_Address')),
                                  DataCell(
                                      Text(snapshot.data!.get('homeAddress'))),
                                  DataCell(
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                      onPressed: () {
                                        _displayDialog(context,
                                            " new Home Address", "homeAddress");
                                      },
                                    ),
                                  ),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Current_Address')),
                                  DataCell(
                                      Text(snapshot.data!.get('homeAddress'))),
                                  DataCell(
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                      onPressed: () {
                                        _displayDialog(
                                            context,
                                            " new Current Address",
                                            "currentAddress");
                                      },
                                    ),
                                  ),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Marital Status')),
                                  DataCell(Text(
                                      snapshot.data!.get('maritalStatus'))),
                                  DataCell(
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                      onPressed: () {
                                        _displayDialog(context,
                                            "Marital Status", "maritalStatus");
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
                        snapshot.data!['imgUrl'].isEmpty
                            ? CircleAvatar(
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
                                    onPressed: () {
                                      _uploadImg();
                                    },
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    NetworkImage(snapshot.data!['imgUrl'])),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            snapshot.data!.get('displayName'),
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            snapshot.data!.get('department'),
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                // fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
