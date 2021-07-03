import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final String uId;

  FirestoreService(this.uId);

  Future<void> updateUserData(
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
}
