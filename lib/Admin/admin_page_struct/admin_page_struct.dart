import 'package:csr_module/Admin/admin_page_struct/admin_page_struct_desktop.dart';
import 'package:csr_module/Admin/admin_page_struct/admin_page_struct_tablet.dart';

import 'package:flutter/material.dart';

class AdminPageStruct extends StatefulWidget {
  const AdminPageStruct({Key? key}) : super(key: key);

  @override
  _AdminPageStructState createState() => _AdminPageStructState();
}

class _AdminPageStructState extends State<AdminPageStruct> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    if (screensize.width >= 990) {
      return AdminPageStructDesktop();
    } else {
      return AdminPageStructTablet();
    }
  }
}
