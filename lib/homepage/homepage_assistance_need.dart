import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class AssistanceNeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Assistance - I Need",
              style: TextStyle(
                  fontSize: 36, color: Color.fromARGB(255, 45, 55, 72)),
            ),
            const Divider(
              thickness: 3,
              color: Color.fromARGB(255, 237, 242, 247),
            ),
          ],
        ),
      ),
    );
  }
}
