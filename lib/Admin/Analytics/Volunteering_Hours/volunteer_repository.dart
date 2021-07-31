import 'package:cloud_firestore/cloud_firestore.dart';

class VolunteerRepository {
  Future getMembers() async {
    List name = [];
    try {
      await FirebaseFirestore.instance
          .collection("core_team")
          //.where("Year", isEqualTo: "2021");
          .doc(DateTime.now().year.toString())
          .collection("members")
          .get()
          .then((value) {
        value.docs.forEach((element) {
          name.add(element.get("name"));
        });
      });

      return name;
    } catch (e) {
      return null;
    }
  }
}
