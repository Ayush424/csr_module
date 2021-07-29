import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.dart';

class SettingSecurity extends StatefulWidget {
  SettingSecurity({Key? key}) : super(key: key);

  @override
  _SettingSecurityState createState() => _SettingSecurityState();
}

class _SettingSecurityState extends State<SettingSecurity> {
  static const int numItems = 20;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  static final List<String> items = <String>[
    'Dropdown',
    '2',
    '3',
    '4',
    '5',
  ];
  String value = items.first;

  _displayDialog(BuildContext context, String details, String field) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              width: 300,
              child: SingleChildScrollView(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Select Employee",
                            style: TextStyle(
                              color: Color.fromARGB(255, 42, 67, 101),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: DropdownButton<String>(
                              value: value,
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                        value: item,
                                      ))
                                  .toList(),
                              onChanged: (value) => setState(() {
                                this.value = value!;
                              }),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Select Role",
                            style: TextStyle(
                              color: Color.fromARGB(255, 42, 67, 101),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: DropdownButton<String>(
                              value: value,
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                        value: item,
                                      ))
                                  .toList(),
                              onChanged: (value) => setState(() {
                                this.value = value!;
                              }),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text('Change'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(45, 55, 72, 1)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 36,
                    color: Color.fromARGB(255, 42, 67, 101),
                    decoration: TextDecoration.none,
                  ),
                ),
                Divider(
                  color: Color.fromARGB(255, 226, 232, 240),
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Admin Role',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 44, 82, 130),
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  height: 210,
                  child: LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      controller: ScrollController(),
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints(minWidth: constraints.minWidth),
                            child: DataTable(
                              columnSpacing: 198,
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text('Emp Code',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                        )),
                                  ),
                                ),
                                DataColumn(
                                  label: Text('Department',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Emp Id',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Admin',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Action',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                numItems,
                                (int index) => DataRow(
                                  color:
                                      MaterialStateProperty.resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Color.fromARGB(255, 237, 242, 247)
                                          .withOpacity(0.08);
                                    }
                                    if (index.isEven) {
                                      return Color.fromARGB(255, 237, 242, 247);
                                    }
                                    return null;
                                  }),
                                  cells: <DataCell>[
                                    DataCell(Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Text('abc'),
                                    )),
                                    DataCell(Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text('abc'),
                                    )),
                                    DataCell(Text("abc")),
                                    DataCell(Text("abc")),
                                    DataCell(
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () {
                                          _displayDialog(
                                              context, " new Address", "Name");
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Wrap(
                  spacing: 850,
                  children: [
                    Text(
                      'Add Employees',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 44, 82, 130),
                        decoration: TextDecoration.none,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 44, 82, 130)),
                      ),
                      child: Text('Select Action'),
                      onPressed: () {
                        setState(() {
                          showSingleChoiceDialog(context);
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  height: 210,
                  child: LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      controller: ScrollController(),
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints(minWidth: constraints.minWidth),
                            child: DataTable(
                              columnSpacing: 175,
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text('Employee Name',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                        )),
                                  ),
                                ),
                                DataColumn(
                                  label: Text('Department',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Date of Joining',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Action',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                                DataColumn(
                                  label: Text('Action',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      )),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                numItems,
                                (int index) => DataRow(
                                  color:
                                      MaterialStateProperty.resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Color.fromARGB(255, 237, 242, 247)
                                          .withOpacity(0.08);
                                    }
                                    if (index.isEven) {
                                      return Color.fromARGB(255, 237, 242, 247);
                                    }
                                    return null;
                                  }),
                                  cells: <DataCell>[
                                    DataCell(Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Text('abc'),
                                    )),
                                    DataCell(Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Text('abc'),
                                    )),
                                    DataCell(Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Text('abc'),
                                    )),
                                    DataCell(IconButton(
                                      padding: EdgeInsets.all(0),
                                      icon: Icon(Icons.check,
                                          color: Colors.green, size: 20),
                                      onPressed: () {},
                                    )),
                                    DataCell(IconButton(
                                      padding: EdgeInsets.all(0),
                                      icon: Icon(Icons.close,
                                          color: Colors.red, size: 20),
                                      onPressed: () {},
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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

  showSingleChoiceDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        var _singleNotifier = Provider.of<SingleNotifier>(context);
        return AlertDialog(
            content: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: choice
                  .map((e) => RadioListTile(
                        title: Text(e),
                        value: e,
                        groupValue: _singleNotifier.currentchoice,
                        selected: _singleNotifier.currentchoice == e,
                        onChanged: (value) {
                          if (value != _singleNotifier.currentchoice) {
                            _singleNotifier.updatechoice(value);
                            Navigator.of(context).pop();
                          }
                        },
                      ))
                  .toList(),
            ),
          ),
        ));
      });
}

class SingleNotifier extends ChangeNotifier {
  String _currentchoice = choice[0];
  SingleNotifier();
  String get currentchoice => _currentchoice;
  updatechoice(value) {
    if (value != _currentchoice) {
      _currentchoice = value;
      notifyListeners();
    }
  }
}
