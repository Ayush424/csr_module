import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Expense extends StatefulWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  late String dateTime;
  late double _height;
  late double _width;
  bool details = false;

  TextEditingController _dateController = TextEditingController();
  final TextEditingController goalController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  final TextEditingController othersController = TextEditingController();

  late DateTime date;
  DateFormat format = DateFormat('MMM, y');
  late DateTime selectedDate;

  @override
  void initState() {
    date = DateTime.now();
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    dateTime = DateFormat.yMd().format(DateTime.now());

    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: ListView(
        controller: ScrollController(),
        children: [
          ListTile(
            title: Text(
              'Expense',
              style: TextStyle(
                  fontSize: 36, color: Color.fromARGB(255, 42, 67, 101)),
            ),
          ),
          Divider(
            thickness: 3,
            color: Color.fromARGB(255, 237, 242, 247),
          ),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 50,
                  runSpacing: 15,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expense on",
                          style: TextStyle(
                              color: Color.fromRGBO(42, 67, 101, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 125,
                          child: TextField(
                            controller: goalController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(hintText: "Name"),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Amount",
                          style: TextStyle(
                              color: Color.fromRGBO(42, 67, 101, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 125,
                          child: TextField(
                            controller: daysController,
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(hintText: "Enter Amount"),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                              color: Color.fromRGBO(42, 67, 101, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: _width / 6,
                          height: _height / 16,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: ListTile(
                            leading: Icon(Icons.event),
                            title: Text(
                                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
                            onTap: _pickdate,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(left: 10),
                          primary: Colors.white,
                          side: BorderSide(
                              color: Color.fromRGBO(2186, 18, 18, 1))),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          height: 70,
                          width: 290,
                          child: Row(
                            children: [
                              Flexible(
                                child: CircleAvatar(
                                    maxRadius: 25,
                                    backgroundColor:
                                        Color.fromRGBO(186, 18, 18, 1),
                                    child: Icon(
                                      Icons.attach_money,
                                      color: Colors.white,
                                      size: 50,
                                    )),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Flexible(
                                child: ListView(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  controller: ScrollController(),
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: Text(
                                              '255.5k ',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      186, 18, 18, 1),
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: 'Rubik'),
                                            ),
                                          ),
                                          Flexible(
                                              flex: 1,
                                              child: Text(
                                                'INR',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Rubik',
                                                  color: const Color.fromRGBO(
                                                      44, 82, 130, 1),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Expense this month',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Rubik',
                                        color: const Color.fromRGBO(
                                            44, 82, 130, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                        child: Chip(
                          backgroundColor: Color.fromRGBO(45, 55, 72, 1),
                          label: const SizedBox(
                            height: 40,
                            width: 60,
                            child: Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          avatar: const Icon(
                            Icons.add_circle_outline_outlined,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                        onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              spacing: 5,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        date = DateTime(date.year, date.month - 1, 15);
                      });
                    },
                    icon: Icon(
                      Icons.arrow_left,
                      size: 30,
                      color: Color.fromARGB(255, 44, 82, 130),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Icon(
                      Icons.event,
                      color: Color.fromARGB(255, 44, 82, 130),
                      size: 23,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(format.format(date),
                      style: TextStyle(
                        fontSize: 23,
                        color: Color.fromARGB(255, 44, 82, 130),
                      )),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        date = DateTime(date.year, date.month + 1, 15);
                      });
                    },
                    icon: Icon(
                      Icons.arrow_right,
                      size: 30,
                      color: Color.fromARGB(255, 44, 82, 130),
                    )),
                SizedBox(
                  width: 120,
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('Name',
                        style: TextStyle(
                          color: Color.fromARGB(255, 44, 82, 130),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  DataColumn(
                    label: Text('Amount',
                        style: TextStyle(
                          color: Color.fromARGB(255, 44, 82, 130),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  DataColumn(
                    label: Text('Date',
                        style: TextStyle(
                            color: Color.fromARGB(255, 44, 82, 130),
                            fontWeight: FontWeight.bold)),
                  ),
                ],
                rows: List<DataRow>.generate(
                  numItems,
                  (int index) => DataRow(
                    color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Color.fromARGB(255, 237, 242, 247)
                            .withOpacity(0.08);
                      }
                      if (index.isEven) {
                        return Color.fromARGB(255, 237, 242, 247);
                      }
                      return null;
                    }),
                    cells: <DataCell>[
                      DataCell(Text('Employee Name')),
                      DataCell(Text('Rs.5000')),
                      DataCell(Text('27th July, 2021')),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _pickdate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (date != null && date != selectedDate) {
      setState(() {
        selectedDate = date;
      });
    }
  }
}
