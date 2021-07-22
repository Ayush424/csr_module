class MyUser {
  final String uid;
  final String? email;

  MyUser(
    this.uid,
    this.email,
  );
}

class MyUserData {
  final String? imgUrl;
  final String? role;
  final Map<String, dynamic>? documents;
  final String? displayName;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? reportingManagerEmail;
  final String? designation;
  final String? businessUnit;
  final String? empCode;
  final String? phoneNo;
  final String? dateOfJoining;
  final String? skypeId;
  final String? department;
  final String? gender;
  final String? homeAddress;
  final String? maritalStatus;
  final String? referedBy;
  final String? sourceOfHire;
  final String? exitDate;
  final String? exitType;
  final String? exitRemarks;
  final String? dateOfBirth;
  final String? placeOfBirth;
  final String? marriageDate;
  final String? citizenship;
  final String? religion;
  final String? bloodGroup;
  final String? spouseName;
  final String? passportNumber;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? country;
  final String? personalEmail;
  final String? employmentType;
  final String? serviceStatus;
  final String? enrollmentNo;
  final String? aadhaarNo;
  final int? previousExp;
  final String? noticePeriod;
  final String? confirmationDate;
  final String? probationPeriod;
  final int? volunteeringHours;
  final String? email;
  MyUserData(
      this.imgUrl,
      this.role,
      this.documents,
      this.displayName,
      this.firstName,
      this.middleName,
      this.lastName,
      this.reportingManagerEmail,
      this.designation,
      this.businessUnit,
      this.empCode,
      this.phoneNo,
      this.dateOfJoining,
      this.skypeId,
      this.department,
      this.gender,
      this.homeAddress,
      this.maritalStatus,
      this.referedBy,
      this.sourceOfHire,
      this.exitDate,
      this.exitType,
      this.exitRemarks,
      this.dateOfBirth,
      this.placeOfBirth,
      this.marriageDate,
      this.citizenship,
      this.religion,
      this.bloodGroup,
      this.spouseName,
      this.passportNumber,
      this.city,
      this.state,
      this.zipCode,
      this.country,
      this.personalEmail,
      this.employmentType,
      this.serviceStatus,
      this.enrollmentNo,
      this.aadhaarNo,
      this.previousExp,
      this.noticePeriod,
      this.confirmationDate,
      this.probationPeriod,
      this.volunteeringHours,
      this.email);
  MyUserData.fromData(Map<String, dynamic> data)
      : role = data["role"],
        imgUrl = data["imgUrl"],
        documents = data["documents"],
        volunteeringHours = data["volunteeringHours"],
        displayName = data["displayName"],
        email = data["email"],
        phoneNo = data["phoneNo"],
        empCode = data["empCode"],
        dateOfJoining = data["dateOfJoining"],
        skypeId = data["skypeId"],
        department = data["department"],
        gender = data["gender"],
        homeAddress = data["homeAddress"],
        maritalStatus = data["maritalStatus"],
        firstName = data["firstName"],
        middleName = data["middleName"],
        lastName = data["lastName"],
        reportingManagerEmail = data["reportingManagerEmail"],
        designation = data["designation"],
        businessUnit = data["businessUnit"],
        referedBy = data["referedBy"],
        sourceOfHire = data["sourceOfHire"],
        exitDate = data["exitDate"],
        exitType = data["exitType"],
        exitRemarks = data["exitRemarks"],
        dateOfBirth = data["dateOfBirth"],
        placeOfBirth = data["placeOfBirth"],
        marriageDate = data["marriageDate"],
        citizenship = data["citizenship"],
        religion = data["religion"],
        bloodGroup = data["bloodGroup"],
        spouseName = data["spouseName"],
        passportNumber = data["passportNumber"],
        city = data["city"],
        state = data["state"],
        zipCode = data["zipCode"],
        country = data["country"],
        personalEmail = data["personalEmail"],
        employmentType = data["employmentType"],
        serviceStatus = data["serviceStatus"],
        enrollmentNo = data["enrollmentNo"],
        aadhaarNo = data["aadhaarNo"],
        previousExp = data["previousExp"],
        noticePeriod = data["noticePeriod"],
        confirmationDate = data["confirmationDate"],
        probationPeriod = data["probationPeriod"];
}
