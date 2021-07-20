import 'package:flutter/material.dart';

class NgoPartners extends StatefulWidget {
  const NgoPartners({Key? key}) : super(key: key);

  @override
  State<NgoPartners> createState() => _NgoPartnersState();
}

class _NgoPartnersState extends State<NgoPartners> {
  static const int numItems2 = 10;
  List<bool> selected = List<bool>.generate(numItems2, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2)),
      height: 400,
      child: ListView.builder(
          controller: ScrollController(),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: numItems2,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return ItemCard2(numItems2: 10);
          }),
    );
  }
}

class ItemCard2 extends StatelessWidget {
  const ItemCard2({
    Key? key,
    required this.numItems2,
  }) : super(key: key);
  final int numItems2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey.shade300,
      )),
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Text(
              'Employee Name',
              style: TextStyle(
                  color: Color.fromRGBO(45, 55, 72, 1),
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
          Flexible(
            child: Text(
              'June 28, 2021',
              style: TextStyle(
                color: Color.fromRGBO(45, 55, 72, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
