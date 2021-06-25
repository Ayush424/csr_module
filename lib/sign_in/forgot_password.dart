import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Text("forgot password"),
    );
  }
}