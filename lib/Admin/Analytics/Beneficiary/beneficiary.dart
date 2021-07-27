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

  late DateTime date;
  final _textFieldController2 = TextEditingController();
  final _textFieldController3 = TextEditingController();
  final _textFieldController4 = TextEditingController();
  final _textFieldController7 = TextEditingController();
  final _textFieldController8 = TextEditingController();
  final _textFieldController9 = TextEditingController();
  final _textFieldController10 = TextEditingController();
  final _textFieldController11 = TextEditingController();
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
                                      controller: _textFieldController2,
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
                                      controller: _textFieldController3,
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
                                      controller: _textFieldController4,
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
                                      controller: _textFieldController7,
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
                                      controller: _textFieldController8,
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
                                      controller: _textFieldController9,
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
                                      controller: _textFieldController10,
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
            actions: <Widget>[
              ElevatedButton(
                child: new Text('Add'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(45, 55, 72, 1)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
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
                  _textFieldController1.clear();
                  _textFieldController2.clear();
                  _textFieldController3.clear();
                  _textFieldController4.clear();
                  _textFieldController7.clear();
                  _textFieldController8.clear();
                  _textFieldController9.clear();
                  _textFieldController10.clear();
                  _textFieldController11.clear();
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
                        child: Wrap(
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
                                      color: Color.fromRGBO(255, 183, 75, 1))),
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
                                                Color.fromRGBO(255, 183, 75, 1),
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
                                          physics: ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          controller: ScrollController(),
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '   209 ',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 183, 75, 1),
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.w900,
                                                      fontFamily: 'Rubik'),
                                                ),
                                                Flexible(
                                                    flex: 1,
                                                    child:
                                                        MyText(text: 'People')),
                                              ],
                                            ),
                                            MyText(text: 'Benefitted so far'),
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
                                      color: Color.fromRGBO(255, 75, 162, 1))),
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
                                                Color.fromRGBO(255, 75, 162, 1),
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
                                                              255, 75, 162, 1),
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontFamily: 'Rubik'),
                                                    ),
                                                  ),
                                                  Flexible(
                                                      flex: 1,
                                                      child: MyText(text: 'INR')),
                                                ],
                                              ),
                                            ),
                                            MyText(
                                              text: 'Total fund collected',
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
                                      color: Color.fromRGBO(186, 18, 18, 1))),
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
                                                Color.fromRGBO(186, 18, 18, 1),
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
                                          physics: ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          controller: ScrollController(),
                                          children: [
                                            Text(
                                              '   25 ',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      186, 18, 18, 1),
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: 'Rubik'),
                                            ),
                                            MyText(text: 'NGO Benefitted'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                          height: 400,
                          width: 1150,
                          color: Color.fromARGB(25, 237, 242, 247),
                          child: ListView.builder(
                            itemCount: numItems,
                            itemBuilder: (context, index){
                            return ExpansionTile(
                              childrenPadding: EdgeInsetsDirectional.only(bottom: 5, top:10),
                              tilePadding:EdgeInsetsDirectional.only(bottom: 15),
                              title:
                            Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Wrap(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              spacing: 120,
                                              runSpacing: 9,
                                              children: [
                                                Text(
                                                  'Beneficiary Name',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 42, 67, 101),
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  'Beneficiary Code',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 42, 67, 101),
                                                      fontSize: 24),
                                                ),
                                                Text(
                                                  'NGO Name',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 42, 67, 101),
                                                      fontSize: 24),
                                                ),
                                                Text(
                                                  'Funds Allocated',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 42, 67, 101),
                                                      fontSize: 24),
                                                ),
                                              ],
                                            ),
                                          ),
                                          children:[
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15),
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
                                                        color: Color.fromARGB(
                                                            255, 42, 67, 101),
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Male',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 42, 67, 101),
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
                                                        color: Color.fromARGB(
                                                            255, 42, 67, 101),
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Address',
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
                                                    'Support Start Date',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 42, 67, 101),
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Date',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 42, 67, 101),
                                                      fontSize: 24,
                                                    ),
                                                  )
                                                ],
                                              ),
                                          ]
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15),
                                              child: Wrap(
                                                 spacing: 270,
                                          runSpacing: 10,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Support End Date',
                                                        style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255, 42, 67, 101),
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                      Text(
                                                        'Date',
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
                                                        color: Color.fromARGB(
                                                            255, 42, 67, 101),
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Number',
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
                                                    'Others',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 42, 67, 101),
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Other Notes',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 42, 67, 101),
                                                      fontSize: 24,
                                                    ),
                                                  )
                                                ],
                                              ),
                                               ],
                                              ),
                                            ),
                                          ]
                            );
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
