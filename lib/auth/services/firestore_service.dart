import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final String? uId;

  FirestoreService(this.uId);

  Future<void> updateUserData(
      String imgUrl,
      Map<String, String> documents,
      int volunteeringHours,
      String displayName,
      String? email,
      String phoneNo,
      String empcode,
      String dateOfJoining,
      String skypeId,
      String department,
      String gender,
      String homeAddress,
      String maritalStatus) async {
    return await FirebaseFirestore.instance.collection("Users").doc(uId).set({
      'imgUrl': imgUrl,
      'documents': documents,
      'volunteering hours': volunteeringHours,
      'displayName': displayName,
      'email': email,
      "phoneNo": phoneNo,
      "empcode": empcode,
      "dateOfJoining": dateOfJoining,
      "skypeId": skypeId,
      "department": department,
      "gender": gender,
      "homeAddress": homeAddress,
      "maritalStatus": maritalStatus,
    });
  }

  Future<void> updatePhone(String phoneNo) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .update({"phoneNo": phoneNo});
  }

  Future<void> updateImg(String imgUrl) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .update({"imgUrl": imgUrl});
  }

  Future<void> updateSkype(String skype) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .update({"skypeId": skype});
  }

  Future<void> updateHome(String home) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .update({"homeAddress": home});
  }

  Future<void> updateCurrent(String current) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .update({"currentAddress": current});
  }

  Future<void> updateMarital(String marital) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .update({"maritalStatus": marital});
  }
}
