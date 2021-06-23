import 'package:flutter/material.dart';

import 'homepage/homepage_profile.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 250, 252),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width > 708
              ? MediaQuery.of(context).size.width / 3
              : 708 / 3,
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4.8,
              ),
              Center(
                child: const Text(
                  "CSR Management",
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  softWrap: false,
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 42, 67, 101),
                      fontWeight: FontWeight.bold),
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
                      TextField(
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color.fromARGB(255, 247, 250, 252)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Chip(
                        label: Text("Password"),
                        backgroundColor: Colors.white,
                        avatar: Icon(Icons.lock_outline),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        obscureText: true,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color.fromARGB(255, 247, 250, 252)),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Wrap(
                        spacing: MediaQuery.of(context).size.width / 15,
                        runSpacing: 15,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: const Flexible(
                                child: Text(
                              "Forgot password?",
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
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHome()),
                                );
                              },
                              child: const Text(
                                "Sign in",
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                softWrap: false,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
