import 'package:cloud_firestore/cloud_firestore.dart';

class VolunteerRepository {
  Future getMembers() async {
    List itemsList = [];
    try {
      await FirebaseFirestore.instance
          .collection("core_team")
          //.where("Year", isEqualTo: "2021");
          .get()
          .then((value) {
        Map<String, dynamic> data = value.docs.single.data();
        itemsList = data["Members"].toList();
      });
      return itemsList;
    } catch (e) {
      return null;
    }
  }
}
