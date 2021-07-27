import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Admin/Analytics/NGO_Partner/ngo_global_count.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:intl/intl.dart';

class NgoPartner extends StatefulWidget {
  final ValueChanged<String>? update;
  const NgoPartner({Key? key, this.update}) : super(key: key);

  @override
  _NgoPartnerState createState() => _NgoPartnerState();
}

class _NgoPartnerState extends State<NgoPartner> {
  static const int numItems = 4;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  bool add = false;
  late DateTime date;
  final TextEditingController _nameController = TextEditingController();
  final _personController = TextEditingController();
  final _categoryController = TextEditingController();
  final _contactController = TextEditingController();
  final _addressController = TextEditingController();
  final _fundsController = TextEditingController();
  final _emailController = TextEditingController();
  final _urlController = TextEditingController();
  final _notesController = TextEditingController();
  DateFormat format = DateFormat('MMM, y');
  late String dateTime;
  late double _height;
  late double _width;
  bool details = false;

  DateTime selectedDate = DateTime.now();

  TextEditingController _dateController1 = TextEditingController();
  TextEditingController _dateController2 = TextEditingController();

  Future<Null> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    setState(() {
      if (picked == null) {
        selectedDate = DateTime.now();
      } else
        selectedDate = picked;
      _dateController1.text = DateFormat.yMd().format(selectedDate);
    });
  }

  Future<Null> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    setState(() {
      if (picked == null) {
        selectedDate = DateTime.now();
      } else
        selectedDate = picked;
      _dateController2.text = DateFormat.yMd().format(selectedDate);
    });
  }

  @override
  void initState() {
    _dateController1.text = DateFormat.yMd().format(DateTime.now());
    _dateController2.text = DateFormat.yMd().format(DateTime.now());
    date = DateTime.now();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              width: 900,
              height: 1000,

              // decoration: BoxDecoration(color: Color.fromARGB(255,237, 242, 247)) ,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: 900,
                    height: 1000,
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 42, 67, 101),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      // obscureText: true,
                                      controller: _nameController,
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "invalid field";
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Enter name",
                                        border: OutlineInputBorder(),
                                        //  contentPadding: EdgeInsets.all(10),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Contact Person',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 42, 67, 101),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      controller: _personController,
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "invalid field";
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Enter name",
                                        border: OutlineInputBorder(),
                                        // contentPadding: EdgeInsets.all(10)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Category',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 42, 67, 101),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      // obscureText: true,
                                      controller: _categoryController,
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "invalid field";
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Enter category",
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.all(10)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Contact number',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 42, 67, 101),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      controller: _contactController,
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "invalid field";
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Enter number",
                                        border: OutlineInputBorder(),
                                        //  contentPadding: EdgeInsets.all(10)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MoU Start Date',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 42, 67, 101),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _selectDate1(context);
                                      },
                                      child: Container(
                                        width: _width / 1.7,
                                        height: _height / 15,
                                        margin: EdgeInsets.only(top: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: TextFormField(
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.start,
                                          enabled: false,
                                          keyboardType: TextInputType.text,
                                          controller: _dateController1,
                                          decoration: InputDecoration(
                                              disabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none),
                                              // labelText: 'Time',
                                              contentPadding:
                                                  EdgeInsets.only(top: 0.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MoU End Date',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 42, 67, 101),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _selectDate2(context);
                                      },
                                      child: Container(
                                        width: _width / 1.7,
                                        height: _height / 15,
                                        margin: EdgeInsets.only(top: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: TextFormField(
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.start,
                                          enabled: false,
                                          keyboardType: TextInputType.text,
                                          controller: _dateController2,
                                          decoration: InputDecoration(
                                              disabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none),
                                              // labelText: 'Time',
                                              contentPadding:
                                                  EdgeInsets.only(top: 0.0)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Address',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 42, 67, 101),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      // obscureText: true,
                                      controller: _addressController,
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "invalid field";
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Enter address",
                                        border: OutlineInputBorder(),
                                        // contentPadding: EdgeInsets.all(10)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Funds Committed',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 42, 67, 101),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      controller: _fundsController,
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "invalid field";
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Enter amount",
                                        border: OutlineInputBorder(),
                                        //contentPadding: EdgeInsets.all(10)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email id',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 42, 67, 101),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      // obscureText: true,
                                      controller: _emailController,
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "invalid field";
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Enter email id",
                                        border: OutlineInputBorder(),
                                        //  contentPadding: EdgeInsets.all(10)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Website URL',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 42, 67, 101),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      controller: _urlController,
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "invalid field";
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Enter URL",
                                        border: OutlineInputBorder(),
                                        //  contentPadding: EdgeInsets.all(10)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 137),
                          child: Container(
                            width: 500,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Notes',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 42, 67, 101),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextFormField(
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  // obscureText: true,
                                  controller: _notesController,
                                  validator: (value) {
                                    return value!.isNotEmpty
                                        ? null
                                        : "invalid field";
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Enter notes",
                                    border: OutlineInputBorder(),
                                    //  contentPadding: EdgeInsets.all(10),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text('Add'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(45, 55, 72, 1)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var startDate = Timestamp.fromDate(
                        DateFormat('M/d/yyyy').parse(_dateController1.text));
                    var endDate = Timestamp.fromDate(
                        DateFormat('M/d/yyyy').parse(_dateController1.text));
                    final Map<String, dynamic> entry = {
                      "name": _nameController.text,
                      "Address": _addressController.text,
                      "URL": _urlController.text,
                      "Funds": _fundsController.text,
                      "Email": _emailController.text,
                      "MouStartDate": startDate,
                      "MouEndDate": endDate,
                      "category": _categoryController.text,
                      "contactNo": _contactController.text,
                      "ngoPrimaryPerson": _personController.text,
                    };
                    FirebaseFirestore.instance
                        .collection("ngos")
                        .add(entry)
                        .then((value) => ScaffoldMessenger.of(context)
                            .showSnackBar(
                                SnackBar(content: Text('Successfully added'))));
                    Navigator.of(context).pop();
                  }
                  // Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: new Text('Cancel'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(45, 55, 72, 1)),
                ),
                onPressed: () {
                  _nameController.clear();
                  _addressController.clear();
                  _contactController.clear();
                  _categoryController.clear();
                  _personController.clear();
                  _fundsController.clear();
                  _emailController.clear();
                  _urlController.clear();
                  _notesController.clear();
                  _dateController1.text =
                      DateFormat.yMd().format(DateTime.now());
                  _dateController2.text =
                      DateFormat.yMd().format(DateTime.now());

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("ngos").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.data!.docs.length == 0) {
                  return Text("no NGO partners");
                } else {
                  Map<String, double> dataMap = {
                    "NGO’s Whose MoU period is running": 0,
                    "NGO’s whose MoU is ending this month": 0,
                  };
                  int ngoCount = 0;
                  var ngoList = snapshot.data!.docs;
                  int numNgo = snapshot.data!.docs.length;
                  for (QueryDocumentSnapshot doc in ngoList) {
                    if (doc["MouEndDate"].toDate().month ==
                        DateTime.now().month) ngoCount++;
                  }
                  dataMap.update("NGO’s Whose MoU period is running",
                      (value) => (numNgo - ngoCount).toDouble());
                  dataMap.update("NGO’s whose MoU is ending this month",
                      (value) => (ngoCount).toDouble());
                  return SingleChildScrollView(
                    controller: ScrollController(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Analytics - NGO Partners',
                          style: TextStyle(
                              color: Color.fromARGB(255, 42, 67, 101),
                              fontSize: 36,
                              decoration: TextDecoration.none),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 226, 232, 240),
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Wrap(
                            spacing: 15,
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      date = DateTime(
                                          date.year, date.month - 1, 15);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_left,
                                    size: 30,
                                    color: Color.fromARGB(255, 44, 82, 130),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: RichText(
                                    text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(
                                    Icons.event,
                                    color: Color.fromARGB(255, 44, 82, 130),
                                    size: 23,
                                  )),
                                  TextSpan(
                                      text: format.format(date),
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Color.fromARGB(255, 44, 82, 130),
                                      ))
                                ])),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      date = DateTime(
                                          date.year, date.month + 1, 15);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_right,
                                    size: 30,
                                    color: Color.fromARGB(255, 44, 82, 130),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Wrap(
                            children: [
                              PieChart(
                                dataMap: dataMap,
                                animationDuration: Duration(milliseconds: 800),
                                chartLegendSpacing:
                                    MediaQuery.of(context).size.width >= 990
                                        ? 100
                                        : 50,
                                // chartRadius: MediaQuery.of(context).size.width / 6,
                                // colorList: colorList,
                                chartRadius: 180,
                                initialAngleInDegree: 0,
                                // ringStrokeWidth: 10,
                                // centerText: "HYBRID",
                                legendOptions: LegendOptions(
                                  showLegendsInRow: false,
                                  legendPosition:
                                      MediaQuery.of(context).size.width >= 990
                                          ? LegendPosition.right
                                          : LegendPosition.bottom,
                                  showLegends: true,
                                  legendTextStyle: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.none,
                                    color: Color.fromARGB(255, 42, 67, 101),
                                  ),
                                ),
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValueBackground: true,
                                  showChartValues: false,
                                  showChartValuesInPercentage: false,
                                  showChartValuesOutside: false,
                                  decimalPlaces: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 200,
                          width: 1200,
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Color.fromARGB(255, 204, 204, 204),
                            width: 1,
                          )),
                          child: SingleChildScrollView(
                            controller: ScrollController(),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: ScrollController(),
                              child: DataTable(
                                columnSpacing: 152,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'NGO Name',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 44, 82, 130),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text('Category',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('MoU Start Date',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('MoU End Date',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('View More',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 82, 130),
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  numNgo,
                                  (int index) => DataRow(
                                    color: MaterialStateProperty.resolveWith<
                                        Color?>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return Color.fromARGB(
                                                255, 237, 242, 247)
                                            .withOpacity(0.08);
                                      }
                                      if (index.isEven) {
                                        return Color.fromARGB(
                                            255, 237, 242, 247);
                                      }
                                      return Color.fromARGB(255, 237, 242, 247);
                                    }),
                                    cells: <DataCell>[
                                      DataCell(Text(ngoList[index]["name"])),
                                      DataCell(
                                          Text(ngoList[index]["category"])),
                                      DataCell(Text(ngoList[index]
                                                  ["MouStartDate"]
                                              .toDate()
                                              .day
                                              .toString() +
                                          "/" +
                                          ngoList[index]["MouStartDate"]
                                              .toDate()
                                              .month
                                              .toString() +
                                          "/" +
                                          ngoList[index]["MouStartDate"]
                                              .toDate()
                                              .year
                                              .toString())),
                                      DataCell(Text(ngoList[index]["MouEndDate"]
                                              .toDate()
                                              .day
                                              .toString() +
                                          "/" +
                                          ngoList[index]["MouEndDate"]
                                              .toDate()
                                              .month
                                              .toString() +
                                          "/" +
                                          ngoList[index]["MouEndDate"]
                                              .toDate()
                                              .year
                                              .toString())),
                                      DataCell(ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 45, 55, 72),
                                        ),
                                        child: Text(
                                          'View more',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          NgoGlobalCount.index = index;
                                          widget.update!("ngoDetails");
                                        },
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Center(
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.add,
                              size: 24.0,
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(45, 55, 72, 1)),
                            ),
                            label: Text('Add New'),
                            onPressed: () {
                              _displayDialog(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
