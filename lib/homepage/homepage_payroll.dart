import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/auth/services/firebase_auth_service.dart';

import 'package:flutter/material.dart';

class HomePayroll extends StatefulWidget {
  const HomePayroll({Key? key}) : super(key: key);

  @override
  _HomePayrollState createState() => _HomePayrollState();
}

class _HomePayrollState extends State<HomePayroll> {
  final AuthService _authService = AuthService();
  static const int numItems = 6;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  static final List<String> ngos = <String>[
    'Select a Ngo',
    'Sikh foundation',
    'Ekohum Foundation',
    'Child In Need Institute',
    'Deepalaya',
    'EVidyaloka',
  ];
  static final List<String> period = <String>[
    'Select Duration',
    '0 months',
    '2 months',
    '4 months',
    '6 months',
    '8 months',
    '10 months',
  ];
  static final List<String> amounts = <String>[
    'Select Amount',
    '0',
    '1000',
    '2000',
    '5000',
  ];
  bool add = false;
  bool edit = false;
  String editvalue1 = ngos.first;
  String editvalue2 = period.first;
  String editvalue3 = amounts.first;
  String value1 = ngos.first;
  String value2 = period.first;
  String value3 = amounts.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all((20)),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Color.fromARGB(255, 204, 204, 204),
                          width: 1,
                        )),
                        child: SingleChildScrollView(
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('payroll')
                                  .doc(_authService.returnCurrentUserid())
                                  .collection('user_payrolls')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.data == null)
                                  return Center(
                                      child: CircularProgressIndicator());
                                else if (snapshot.data!.docs.length > 0) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      DataTable(
                                        columns: const <DataColumn>[
                                          DataColumn(
                                            label: Text('Ngo Name',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 44, 82, 130))),
                                          ),
                                          DataColumn(
                                            label: Text('Period',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 44, 82, 130))),
                                          ),
                                          DataColumn(
                                            label: Text('Amount',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 44, 82, 130),
                                                )),
                                          ),
                                        ],
                                        rows: List<DataRow>.generate(
                                          snapshot.data!.docs.length,
                                          (int index) => DataRow(
                                            color: MaterialStateProperty
                                                .resolveWith<Color?>(
                                                    (Set<MaterialState>
                                                        states) {
                                              if (states.contains(
                                                  MaterialState.selected)) {
                                                return Color.fromARGB(
                                                        255, 237, 242, 247)
                                                    .withOpacity(0.08);
                                              }
                                              if (index.isEven) {
                                                return Color.fromARGB(
                                                    255, 237, 242, 247);
                                              }
                                              return null;
                                            }),
                                            cells: <DataCell>[
                                              DataCell(Text(snapshot
                                                  .data!.docs[index]['ngo'])),
                                              DataCell(Text(snapshot.data!
                                                  .docs[index]['period'])),
                                              DataCell(Text(snapshot.data!
                                                  .docs[index]['amount'])),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Center(
                                    child: Text(
                                        "No entries to show add some now",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 44, 82, 130))),
                                  );
                                }
                              }),
                        ),
                      ),
                    ),
                    Center(
                      child: Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 4.0,
                        children: [
                          ElevatedButton.icon(
                            icon: Icon(
                              Icons.edit,
                              size: 24.0,
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(45, 55, 72, 1)),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(10)),
                            ),
                            label: Text('Request Edit'),
                            onPressed: () {
                              setState(() {
                                edit = true;
                                add = false;
                              });
                            },
                          ),
                          SizedBox(width: 30),
                          ElevatedButton.icon(
                            icon: Icon(
                              Icons.add,
                              size: 24.0,
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(45, 55, 72, 1)),
                            ),
                            label: Text('Add'),
                            onPressed: () {
                              setState(() {
                                add = true;
                                edit = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    edit == true
                        ? Center(
                            child: Container(
                              height: 200,
                              decoration: new BoxDecoration(
                                color: Color.fromARGB(255, 237, 242, 247),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 50, 30, 50),
                                child: Wrap(
                                  spacing: 70,
                                  runSpacing: 30,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "NGO",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 55, 72, 1)),
                                          ),
                                          Container(
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white,
                                            ),
                                            child: DropdownButton<String>(
                                              value: editvalue1,
                                              items: ngos
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        value: item,
                                                      ))
                                                  .toList(),
                                              onChanged: (value) =>
                                                  setState(() {
                                                this.editvalue1 = value!;
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Period",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 55, 72, 1)),
                                          ),
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white,
                                            ),
                                            child: DropdownButton<String>(
                                              value: editvalue2,
                                              items: period
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        value: item,
                                                      ))
                                                  .toList(),
                                              onChanged: (value) =>
                                                  setState(() {
                                                this.editvalue2 = value!;
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Amount",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 55, 72, 1)),
                                          ),
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white,
                                            ),
                                            child: DropdownButton<String>(
                                              value: editvalue3,
                                              items: amounts
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        value: item,
                                                      ))
                                                  .toList(),
                                              onChanged: (value) =>
                                                  setState(() {
                                                this.editvalue3 = value!;
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 42, 67, 101)),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              edit = false;
                                            });
                                          },
                                          child: const Text("Cancel")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 42, 67, 101)),
                                          ),
                                          onPressed: () async {
                                            if (editvalue1 != ngos.first &&
                                                editvalue2 != period.first &&
                                                editvalue3 != amounts.first) {
                                              final query =
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('payroll')
                                                      .doc(_authService
                                                          .returnCurrentUserid())
                                                      .collection(
                                                          'user_payrolls')
                                                      .where('ngo',
                                                          isEqualTo: editvalue1)
                                                      .get();
                                              if (query.docs.isEmpty) {
                                                setState(() {
                                                  edit = false;
                                                });
                                              } else {
                                                query.docs.single.reference
                                                    .update({
                                                  "amount": editvalue3,
                                                  "period": editvalue2
                                                }).then(
                                                  (result) =>
                                                      showDialog<String>(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                      content: SizedBox(
                                                        height: 150,
                                                        child: Center(
                                                          child: Text(
                                                            'Changed Successfully',
                                                            style: TextStyle(
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              edit = false;
                                                              editvalue1 =
                                                                  ngos.first;
                                                              editvalue2 =
                                                                  period.first;
                                                              editvalue3 =
                                                                  amounts.first;
                                                            });
                                                            Navigator.pop(
                                                                context, 'OK');
                                                          },
                                                          child:
                                                              const Text('OK'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) => AlertDialog(
                                                        content: Text(
                                                          'Please select a value for all the fields',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context,
                                                                    'OK'),
                                                            child: const Text(
                                                                'OK'),
                                                          ),
                                                        ],
                                                      ));
                                            }
                                          },
                                          child: const Text("Done")),
                                    ),
                                    // edit == false ? Text("Done") : Text(""),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Text(""),
                    add == true
                        ? Center(
                            child: Container(
                              height: 200,
                              decoration: new BoxDecoration(
                                color: Color.fromARGB(255, 237, 242, 247),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 50, 30, 50),
                                child: Wrap(
                                  spacing: 70,
                                  runSpacing: 30,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "NGO",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 55, 72, 1)),
                                          ),
                                          Container(
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white,
                                            ),
                                            child: DropdownButton<String>(
                                              value: value1,
                                              items: ngos
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        value: item,
                                                      ))
                                                  .toList(),
                                              onChanged: (value) =>
                                                  setState(() {
                                                value1 = value!;
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Period",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 55, 72, 1)),
                                          ),
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white,
                                            ),
                                            child: DropdownButton<String>(
                                              value: value2,
                                              items: period
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        value: item,
                                                      ))
                                                  .toList(),
                                              onChanged: (value) =>
                                                  setState(() {
                                                value2 = value!;
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Amount",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 55, 72, 1)),
                                          ),
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white,
                                            ),
                                            child: DropdownButton<String>(
                                              value: value3,
                                              items: amounts
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        value: item,
                                                      ))
                                                  .toList(),
                                              onChanged: (value) =>
                                                  setState(() {
                                                value3 = value!;
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 42, 67, 101)),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              add = false;
                                              value1 = ngos.first;
                                              value2 = period.first;
                                              value3 = amounts.first;
                                            });
                                          },
                                          child: const Text("Cancel")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 42, 67, 101)),
                                          ),
                                          onPressed: () {
                                            if (value1 != ngos.first &&
                                                value2 != period.first &&
                                                value3 != amounts.first) {
                                              FirebaseFirestore.instance
                                                  .collection('payroll')
                                                  .doc(_authService
                                                      .returnCurrentUserid())
                                                  .collection('user_payrolls')
                                                  .add({
                                                'ngo': value1,
                                                'period': value2,
                                                'amount': value3
                                              }).then(
                                                (result) => showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    content: SizedBox(
                                                      height: 150,
                                                      child: Center(
                                                        child: Text(
                                                          'Added Successfully',
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            add = false;
                                                            value1 = ngos.first;
                                                            value2 =
                                                                period.first;
                                                            value3 =
                                                                amounts.first;
                                                          });
                                                          Navigator.pop(
                                                              context, 'OK');
                                                        },
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) => AlertDialog(
                                                        content: Text(
                                                          'Please select a value for all the fields',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context,
                                                                    'OK'),
                                                            child: const Text(
                                                                'OK'),
                                                          ),
                                                        ],
                                                      ));
                                            }
                                          },
                                          child: const Text("Done")),
                                    ),
                                    //add == false ? Text("Done") : Text(""),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Text(""),
                    //ok bye
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
