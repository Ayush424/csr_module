import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  Color color = Colors.white;
  String error = '';
  final _formKey = GlobalKey<FormState>();
  String email = '';
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 250, 252),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width > 708
              ? MediaQuery.of(context).size.width / 3
              : 708 / 3,
          child: Form(
            key: _formKey,
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4.8,
                ),
                Center(
                  child: const Text(
                    "Reset your Password",
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 42, 67, 101),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  //  width: MediaQuery.of(context).size.width > 708
                  //    ? MediaQuery.of(context).size.width / 3
                  //  : 708 / 3,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Chip(
                          label: Text("Email Address"),
                          backgroundColor: Colors.white,
                          avatar: Icon(Icons.email_outlined),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? "Please enter an Email" : null,
                          style: const TextStyle(fontSize: 20),
                          onChanged: (value) {
                            setState(() => email = value);
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color.fromARGB(255, 247, 250, 252)),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Wrap(
                          spacing: MediaQuery.of(context).size.width / 15,
                          runSpacing: 15,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                        Size(150, 40)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 42, 67, 101)),
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Cancel",
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    softWrap: false,
                                  )),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(Size(150, 40)),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 42, 67, 101)),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  dynamic result =
                                      await _auth.resetPassword(email);
                                  if (result == "null") {
                                    setState(() {
                                      color = Colors.red;
                                      error = 'Please enter valid email';
                                    });
                                  } else {
                                    setState(() {
                                      color = Colors.green;
                                      error = 'Email succesfully sent';
                                    });
                                  }
                                }
                              },
                              child: const Text(
                                "Send Link",
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            error,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            softWrap: false,
                            style: TextStyle(color: color),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
