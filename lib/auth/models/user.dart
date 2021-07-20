class MyUser {
  final Map<String, String>? documents;
  final String? imgUrl;
  final String uid;
  final String? displayName;
  final String? email;
  final String? empCode;
  final String? phoneNo;
  final String? dateOfJoining;
  final String? skypeId;
  final String? department;
  final String? gender;
  final String? homeAddress;
  final String? maritalStatus;
  MyUser(this.uid, this.email,
      {this.imgUrl,
      this.documents,
      this.empCode,
      this.phoneNo,
      this.dateOfJoining,
      this.skypeId,
      this.department,
      this.gender,
      this.homeAddress,
      this.maritalStatus,
      this.displayName});
}
