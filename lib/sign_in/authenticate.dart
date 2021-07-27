import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:csr_module/Admin/admin_page_struct/admin_user_manager.dart';
import 'package:csr_module/User/main_page_struct/main_page_struct.dart';
import 'package:csr_module/auth/models/user.dart';

import 'package:csr_module/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyUser? user = Provider.of<MyUser?>(context);
    if (user == null) {
      return SignInPage();
    } else {
      return StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(user.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null)
              return Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            if (snapshot.data!["role"] == "admin") {
              return UserAdmin();
            } else {
              return MainPageStruct(role: "user");
            }
          });
    }
  }
}
