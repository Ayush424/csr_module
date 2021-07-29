import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csr_module/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'themes/Colors.dart';

class Beneficiary extends StatefulWidget {
  const Beneficiary({Key? key}) : super(key: key);

  @override
  _BeneficiaryState createState() => _BeneficiaryState();
}

class _BeneficiaryState extends State<Beneficiary> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  TextEditingController _textFieldController1 = TextEditingController();
  final ScrollController _alwaysshownBarController = ScrollController();

  late DateTime date;
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  final _fundsController = TextEditingController();
  final _ngoController = TextEditingController();
  final _genderController = TextEditingController();
  final _aadharController = TextEditingController();
  final _codeController = TextEditingController();
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
                controller: ScrollController(),
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
                                      TextFormField(
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        // obscureText: true,
                                        controller: _textFieldController1,
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
                                      'NGO name',
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
                                      controller: _ngoController,
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
                                    ],
                                  ),
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
                                      'Code',
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
                                      controller: _codeController,
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "invalid field";
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Enter code",
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
                                      'Gender',
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
                                      controller: _genderController,
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "invalid field";
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Enter Gender",
                                        border: OutlineInputBorder(),
                                        //  contentPadding: EdgeInsets.all(10)

                                      ),
                                    ],
                                  ),
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
                                      'Support Start Date',
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
                                              border: Border.all(
                                                  color: Colors.grey)),
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
                                      )
                                    ],
                                  ),
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
                                      'Support End Date',
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
                                              border: Border.all(
                                                  color: Colors.grey)),
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
                                      'Aadhar number',
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
                                      controller: _aadharController,
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "invalid field";
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Enter Aadhar",
                                        border: OutlineInputBorder(),
                                        // contentPadding: EdgeInsets.all(10)

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Funds Committed',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 42, 67, 101),
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
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
                                    ],
                                  ),
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
                                  'Address',
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
                                  controller: _addressController,
                                  validator: (value) {
                                    return value!.isNotEmpty
                                        ? null
                                        : "invalid field";
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Enter Address",
                                    border: OutlineInputBorder(),
                                    //  contentPadding: EdgeInsets.all(10),

                                  ),
                                  TextFormField(
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    // obscureText: true,
                                    controller: _textFieldController11,
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
                      "ngoName": _ngoController.text,
                      "funds": int.parse(_fundsController.text),
                      "AadharNo": _aadharController.text,
                      "suppStartDate": startDate,
                      "suppEndDate": endDate,
                      "code": _codeController.text,
                      "Gender": _genderController.text,
                    };
                    FirebaseFirestore.instance
                        .collection("Beneficiaries")
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
                  _genderController.clear();
                  _fundsController.clear();
                  _aadharController.clear();
                  _addressController.clear();
                  _codeController.clear();
                  _ngoController.clear();
                  _nameController.clear();

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

    return Scaffold(
      body: Container(
          color: Colors.white,
          constraints: BoxConstraints.expand(),
          child: Padding(
              padding: EdgeInsets.all(40),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Analytics - Beneficiary',
                        style: TextStyle(
                            color: Color.fromARGB(255, 42, 67, 101),
                            fontSize: 36,
                            decoration: TextDecoration.none),
                      ),
                      Divider(
                        color: Color.fromARGB(255, 226, 232, 240),
                        thickness: 2,
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("Beneficiaries")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                int funds = 0;
                                int beneficiaries = 0;
                                for (QueryDocumentSnapshot doc
                                    in snapshot.data!.docs) {
                                  int fund = doc["funds"].toInt();
                                  beneficiaries += 1;
                                  funds += fund;
                                }
                                return Wrap(
                                  runSpacing: 10,
                                  spacing: 10,
                                  direction: Axis.horizontal,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.only(left: 10),
                                          primary: Colors.white,
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 183, 75, 1))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: SizedBox(
                                          height: 70,
                                          width: 290,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            255, 183, 75, 1),
                                                    child: Icon(
                                                      Icons.how_to_reg,
                                                      color: Colors.white,
                                                      size: 40,
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Flexible(
                                                child: ListView(
                                                  physics:
                                                      ClampingScrollPhysics(),
                                                  shrinkWrap: true,
                                                  controller:
                                                      ScrollController(),
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '  ' +
                                                              snapshot.data!
                                                                  .docs.length
                                                                  .toString() +
                                                              '  ',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      183,
                                                                      75,
                                                                      1),
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontFamily:
                                                                  'Rubik'),
                                                        ),
                                                        Flexible(
                                                            flex: 1,
                                                            child: MyText(
                                                                text:
                                                                    'People')),
                                                      ],
                                                    ),
                                                    MyText(
                                                        text:
                                                            'Benefitted so far'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.only(left: 10),
                                          primary: Colors.white,
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 75, 162, 1))),
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
                                                        Color.fromRGBO(
                                                            255, 75, 162, 1),
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
                                                  physics:
                                                      ClampingScrollPhysics(),
                                                  shrinkWrap: true,
                                                  controller:
                                                      ScrollController(),
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Flexible(
                                                            flex: 2,
                                                            child: Text(
                                                              funds.toString() +
                                                                  ' ',
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          75,
                                                                          162,
                                                                          1),
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  fontFamily:
                                                                      'Rubik'),
                                                            ),
                                                          ),
                                                          Flexible(
                                                              flex: 1,
                                                              child: MyText(
                                                                  text: 'INR')),
                                                        ],
                                                      ),
                                                    ),
                                                    MyText(
                                                      text:
                                                          'Total fund collected',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.only(left: 10),
                                          primary: Colors.white,
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  186, 18, 18, 1))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: SizedBox(
                                          height: 70,
                                          width: 290,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            186, 18, 18, 1),
                                                    child: Icon(
                                                      Icons.people_outlined,
                                                      color: Colors.white,
                                                      size: 40,
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Flexible(
                                                child: ListView(
                                                  physics:
                                                      ClampingScrollPhysics(),
                                                  shrinkWrap: true,
                                                  controller:
                                                      ScrollController(),
                                                  children: [
                                                    Text(
                                                      '   25 ',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              186, 18, 18, 1),
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontFamily: 'Rubik'),
                                                    ),
                                                    MyText(
                                                        text: 'NGO Benefitted'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            }),
                      ),
                      SizedBox(height: 100),
                      Text(
                        'Beneficiary',
                        style: TextStyle(
                            color: Color.fromARGB(255, 42, 67, 101),
                            fontSize: 30,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Color.fromARGB(255, 226, 232, 240),
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 350,
                        width: 1150,
                        color: teal,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("Beneficiaries")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.data!.docs.length == 0) {
                                return Center(child: Text("No beneficiaries"));
                              } else {
                                return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      QueryDocumentSnapshot data =
                                          snapshot.data!.docs[index];
                                      return ExpansionTile(
                                          backgroundColor: Colors.white,
                                          collapsedBackgroundColor:
                                              (index % 2 != 0)
                                                  ? Colors.white
                                                  : teal,
                                          childrenPadding:
                                              EdgeInsetsDirectional.only(
                                                  bottom: 5, top: 10),
                                          tilePadding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          title: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Wrap(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              spacing: 120,
                                              runSpacing: 9,
                                              children: [
                                                Text(
                                                  data["name"],
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 42, 67, 101),
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  data['code'],
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 42, 67, 101),
                                                      fontSize: 24),
                                                ),
                                                Text(
                                                  data["ngoName"],
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 42, 67, 101),
                                                      fontSize: 24),
                                                ),
                                                Text(
                                                  data['funds'].toString(),
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 42, 67, 101),
                                                      fontSize: 24),
                                                ),
                                              ],
                                            ),
                                          ),
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Wrap(
                                                  // alignment: WrapAlignment.start,
                                                  spacing: 270,
                                                  runSpacing: 10,
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Gender',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      42,
                                                                      67,
                                                                      101),
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          data["Gender"],
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    42,
                                                                    67,
                                                                    101),
                                                            fontSize: 24,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Address',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      42,
                                                                      67,
                                                                      101),
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          data['Address'],
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    42,
                                                                    67,
                                                                    101),
                                                            fontSize: 24,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Support Start Date',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      42,
                                                                      67,
                                                                      101),
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          data['suppStartDate']
                                                                  .toDate()
                                                                  .day
                                                                  .toString() +
                                                              '/' +
                                                              data['suppStartDate']
                                                                  .toDate()
                                                                  .month
                                                                  .toString() +
                                                              '/' +
                                                              data['suppStartDate']
                                                                  .toDate()
                                                                  .year
                                                                  .toString(),
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    42,
                                                                    67,
                                                                    101),
                                                            fontSize: 24,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Wrap(
                                                spacing: 270,
                                                runSpacing: 10,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Support End Date',
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    42,
                                                                    67,
                                                                    101),
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        data['suppEndDate']
                                                                .toDate()
                                                                .day
                                                                .toString() +
                                                            '/' +
                                                            data['suppEndDate']
                                                                .toDate()
                                                                .month
                                                                .toString() +
                                                            '/' +
                                                            data['suppEndDate']
                                                                .toDate()
                                                                .year
                                                                .toString(),
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 42, 67, 101),
                                                          fontSize: 24,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Aadhar Number',
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    42,
                                                                    67,
                                                                    101),
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        data['AadharNo'],
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 42, 67, 101),
                                                          fontSize: 24,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  // Column(
                                                  //   children: [
                                                  //     Text(
                                                  //       'Others',
                                                  //       style: TextStyle(
                                                  //           color:
                                                  //               Color.fromARGB(
                                                  //                   255,
                                                  //                   42,
                                                  //                   67,
                                                  //                   101),
                                                  //           fontSize: 24,
                                                  //           fontWeight:
                                                  //               FontWeight
                                                  //                   .bold),
                                                  //     ),
                                                  //     Text(
                                                  //       'Other Notes',
                                                  //       style: TextStyle(
                                                  //         color: Color.fromARGB(
                                                  //             255, 42, 67, 101),
                                                  //         fontSize: 24,
                                                  //       ),
                                                  //     )
                                                  //   ],
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ]);
                                    });
                              }
                            }),
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
                    ]),
              ))),
    );
  }
}

class MyText extends StatefulWidget {
  final String text;
  const MyText({Key? key, required this.text}) : super(key: key);

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        fontFamily: 'Rubik',
        color: const Color.fromRGBO(44, 82, 130, 1),
      ),
    );
  }
}
