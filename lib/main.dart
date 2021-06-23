import 'package:csr_module/sign_in_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'CSR Module',
    theme: ThemeData(primaryColor: const Color.fromARGB(255, 42, 67, 101)),
    home: const SignInPage(),
  ));
}
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// // ignore: use_key_in_widget_constructors
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Explore',
//       theme: ThemeData(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//     );
//   }
// }
//
// // ignore: use_key_in_widget_constructors
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   get onDelete => null;
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size(screenSize.width, 1000),
//         child: Container(
//           color: const Color.fromRGBO(45, 55, 72, 1),
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(left: 20),
//                 ),
//                 const Icon(
//                   Icons.crop_square_sharp,
//                   color: Colors.white,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20),
//                 ),
//                 const Text(
//                   'CSR Management',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 Expanded(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           primary: const Color.fromRGBO(213, 63, 140, 1),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 10),
//                         ),
//                         child: const Text(
//                           'Pro plan',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       padding: const EdgeInsets.only(
//                           bottom: 45, right: 20, left: 20),
//                       onPressed: onDelete,
//                       hoverColor: Colors.deepPurpleAccent,
//                       icon: const Icon(Icons.account_circle,
//                           size: 58.0, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: PreferredSize(
//         preferredSize: Size(screenSize.width, 1000),
//         child: Container(
//           width: MediaQuery.of(context).size.width * 0.15,
//           height: MediaQuery.of(context).size.height * 1.0,
//           color: Colors.blueGrey[100],
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               ListTile(
//                 title: Text(
//                   "Manage/Control Panel",
//                   style: TextStyle(color: Colors.lightBlue),
//                 ),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.assessment_outlined),
//                 title: Text("Dashboard"),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.home_outlined),
//                 title: Text("My Home"),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.help_outline),
//                 title: Text("Assistance"),
//                 trailing: Icon(Icons.arrow_forward_ios_sharp),
//                 subtitle: Text('I can'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.people_outline_outlined),
//                 title: Text("CSR Cell"),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.extension),
//                 title: Text("Activity"),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 title: Text(
//                   "Pro Features",
//                   style: TextStyle(color: Colors.lightBlue),
//                 ),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.plumbing),
//                 title: Text("Plugins"),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.local_cafe_outlined),
//                 title: Text("Upgrade Plans"),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }