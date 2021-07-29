import 'package:cloud_firestore/cloud_firestore.dart';

class VolunteerRepository {
  Future getMembers(String? uid) async {
    String name = '';
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          //.where("Year", isEqualTo: "2021");
          .get()
          .then((value) {
        Map<String, dynamic> data = value.data()!;
        name = data["name"];
      });
      return name;
    } catch (e) {
      return null;
    }
  }
}
