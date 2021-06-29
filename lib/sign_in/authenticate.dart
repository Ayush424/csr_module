import 'package:csr_module/auth/models/user.dart';
import 'package:csr_module/main_page_struct.dart';
import 'package:csr_module/homepage/homepage_profile.dart';
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
      return MainPageStruct();
    }
  }
}
