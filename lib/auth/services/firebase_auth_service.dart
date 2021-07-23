import 'package:csr_module/auth/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firestore_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //user to firebase user
  MyUser? _userFromFirebaseUser(User? user) {
    // return user != null
    //     ? MyUser(
    //         uid: user.uid, displayName: user.displayName, email: user.email)
    //     : null;
    return user != null ? MyUser(user.uid, user.email) : null;
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // create a new document for the user with the uid
      // await FirestoreService(user!.uid).updateUserData(
      //     "https://firebasestorage.googleapis.com/v0/b/csrmanagement-a6a16.appspot.com/o/blank-profile-picture-973460_1280.png?alt=media&token=733e7008-60af-48d8-9c86-d09b3e0e2152",
      //     {},
      //     0,
      //     "displayName",
      //     email,
      //     "phoneNo",
      //     "empcode",
      //     "dateOfJoining",
      //     "skypeId",
      //     "department",
      //     "gender",
      //     "homeAddress",
      //     "maritalStatus");
      await FirestoreService(user!.uid).updateUserData(
          "user",
          0,
          {},
          "",
          "uid",
          "displayName",
          "firstName",
          "middleName",
          "lastName",
          "reportingManagerEmail",
          "designation",
          "businessUnit",
          email,
          "empCode",
          "phoneNo",
          user.metadata.creationTime!.day.toString() +
              '/' +
              user.metadata.creationTime!.month.toString() +
              '/' +
              user.metadata.creationTime!.year.toString(),
          "skypeId",
          "department",
          "gender",
          "homeAddress",
          "maritalStatus",
          "referedBy",
          "sourceOfHire",
          "exitDate",
          "exitType",
          "exitRemarks",
          "dateOfBirth",
          "placeOfBirth",
          "marriageDate",
          "citizenship",
          "religion",
          "bloodGroup",
          "spouseName",
          "passportNumber",
          "city",
          "state",
          "zipCode",
          "country",
          "personalEmail",
          "employmentType",
          "serviceStatus",
          "enrollmentNo",
          "aadhaarNo",
          0,
          "noticePeriod",
          "confirmationDate",
          "probationPeriod");
      return _userFromFirebaseUser(user);
    } catch (error) {
      //print(error.toString());
      return null;
    }
  }

  //temporary loading data function
  Future<void> loadMyData() async {
    User? user = _auth.currentUser;
    await FirestoreService(user!.uid).updateUserData(
        "user",
        0,
        {},
        "",
        "uid",
        "displayName",
        "firstName",
        "middleName",
        "lastName",
        "reportingManagerEmail",
        "designation",
        "businessUnit",
        user.email,
        "empCode",
        "phoneNo",
        user.metadata.creationTime!.day.toString() +
            '/' +
            user.metadata.creationTime!.month.toString() +
            '/' +
            user.metadata.creationTime!.year.toString(),
        "skypeId",
        "department",
        "gender",
        "homeAddress",
        "maritalStatus",
        "referedBy",
        "sourceOfHire",
        "exitDate",
        "exitType",
        "exitRemarks",
        "dateOfBirth",
        "placeOfBirth",
        "marriageDate",
        "citizenship",
        "religion",
        "bloodGroup",
        "spouseName",
        "passportNumber",
        "city",
        "state",
        "zipCode",
        "country",
        "personalEmail",
        "employmentType",
        "serviceStatus",
        "enrollmentNo",
        "aadhaarNo",
        0,
        "noticePeriod",
        "confirmationDate",
        "probationPeriod");
  }

  //signin anonm
  Future signIn(email, password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      // print(e.toString());
      return null;
    }
  }

  String? returnCurrentUserEmail() {
    return _userFromFirebaseUser(_auth.currentUser)!.email;
  }

  String? returnCurrentUserid() {
    return _userFromFirebaseUser(_auth.currentUser)!.uid;
  }

  //stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future resetPassword(email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'invalid-email') {
        return 'null';
      }
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      // print(e.toString());
      return null;
    }
  }
}
