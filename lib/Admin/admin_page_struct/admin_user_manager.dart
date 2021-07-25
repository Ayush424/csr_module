import 'package:csr_module/Admin/admin_page_struct/admin_page_struct.dart';
import 'package:csr_module/Admin/admin_page_struct/static_admin_page.dart';
import 'package:csr_module/User/main_page_struct/main_page_struct.dart';
import 'package:flutter/material.dart';

class UserAdmin extends StatefulWidget {
  const UserAdmin({Key? key}) : super(key: key);

  @override
  _UserAdminState createState() => _UserAdminState();
}

class _UserAdminState extends State<UserAdmin> {
  void _update(String adminUser) {
    setState(() {
      GlobalAdminPage.userAdmin = adminUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (GlobalAdminPage.userAdmin == "admin") {
      return AdminPageStruct(update: _update);
    } else {
      return MainPageStruct(
        role: "admin",
        updateAdmin: _update,
      );
    }
  }
}
