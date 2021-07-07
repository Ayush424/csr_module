import 'package:csr_module/main_page_struct/main_page_struct_desktop.dart';
import 'package:csr_module/main_page_struct/main_page_struct_tablet.dart';

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MainPageStruct extends StatefulWidget {
  @override
  State<MainPageStruct> createState() => _HomePageStructState();
}

class _HomePageStructState extends State<MainPageStruct> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    if (screensize.width > 990) {
      return MainPageStructDesktop();
    } else if (screensize.width <= 990) {
      return MainPageStructTablet();
    } else {
      return Container();
    }
  }
}
