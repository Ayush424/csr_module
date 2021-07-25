import 'package:csr_module/auth/services/firebase_auth_service.dart';
import 'package:csr_module/sign_in/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Admin/Settings/setting_security.dart';
import 'auth/models/user.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SingleNotifier>(
        create: (_) => SingleNotifier(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CSR Module',
        theme: ThemeData(primaryColor: const Color.fromARGB(255, 42, 67, 101)),
        home: const Authenticate(),
      ),
    );
  }
}
