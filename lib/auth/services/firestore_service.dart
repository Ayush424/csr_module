import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final String? uId;

  FirestoreService(this.uId);

  Future<void> updateUserData(
    String role,
    int volunteeringHours,
    Map<String, String> documents,
    String imgUrl,
    String? uid,
    String displayName,
    String firstName,
    String middleName,
    String lastName,
    String reportingManagerEmail,
    String designation,
    String businessUnit,
    String? email,
    String empCode,
    String phoneNo,
    String dateOfJoining,
    String skypeId,
    String department,
    String gender,
    String homeAddress,
    String maritalStatus,
    String referedBy,
    String sourceOfHire,
    String exitDate,
    String exitType,
    String exitRemarks,
    String dateOfBirth,
    String placeOfBirth,
    String marriageDate,
    String citizenship,
    String religion,
    String bloodGroup,
    String spouseName,
    String passportNumber,
    String city,
    String state,
    String zipCode,
    String country,
    String personalEmail,
    String employmentType,
    String serviceStatus,
    String enrollmentNo,
    String aadhaarNo,
    int previousExp,
    String noticePeriod,
    String confirmationDate,
    String probationPeriod,
  ) async {
    return await FirebaseFirestore.instance.collection("Users").doc(uId).set({
      'role': role,
      'imgUrl': imgUrl,
      'documents': documents,
      'volunteering hours': volunteeringHours,
      'displayName': displayName,
      'email': email,
      "phoneNo": phoneNo,
      "empcode": empCode,
      "dateOfJoining": dateOfJoining,
      "skypeId": skypeId,
      "department": department,
      "gender": gender,
      "homeAddress": homeAddress,
      "maritalStatus": maritalStatus,
      "firstName": firstName,
      "middleName": middleName,
      "lastName": lastName,
      "reportingManagerEmail": reportingManagerEmail,
      "designation": designation,
      "businessUnit": businessUnit,
      "referedBy": referedBy,
      "sourceOfHire": sourceOfHire,
      "exitDate": exitDate,
      "exitType": exitType,
      "exitRemarks": exitRemarks,
      "dateOfBirth": dateOfBirth,
      "placeOfBirth": placeOfBirth,
      "marriageDate": marriageDate,
      "citizenship": citizenship,
      "religion": religion,
      "bloodGroup": bloodGroup,
      "spouseName": spouseName,
      "passportNumber": passportNumber,
      "city": city,
      "state": state,
      "zipCode": zipCode,
      "country": country,
      "personalEmail": personalEmail,
      "employmentType": employmentType,
      "serviceStatus": serviceStatus,
      "enrollmentNo": enrollmentNo,
      "aadhaarNo": aadhaarNo,
      "previousExp": previousExp,
      "noticePeriod": noticePeriod,
      "confirmationDate": confirmationDate,
      "probationPeriod": probationPeriod,
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
