import 'package:flutter/material.dart';

class DollarForDollar extends StatefulWidget {
  const DollarForDollar({Key? key}) : super(key: key);

  @override
  _DollarForDollarState createState() => _DollarForDollarState();
}

class _DollarForDollarState extends State<DollarForDollar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Wrap(
          //crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Dollar for dollar",
              style: TextStyle(
                  fontSize: 36, color: Color.fromARGB(255, 45, 55, 72)),
            ),
            const Divider(
              thickness: 3,
              color: Color.fromARGB(255, 237, 242, 247),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                height: 500,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 204, 204, 204))),
                  child: Container(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
