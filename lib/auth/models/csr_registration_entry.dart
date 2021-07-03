class CsrEntry {
  final String others;
  final String areaOfInterest1;
  final String areaOfInterest2;
  final String? uId;
  CsrEntry(this.others, this.areaOfInterest1, this.areaOfInterest2, this.uId);

  String convertuId(uId) {
    if (uId == null) {
      return "";
    } else {
      return uId;
    }
  }

  Map<String, dynamic> ToMap() {
    return {
      'others': others,
      'areaofinterest1': areaOfInterest1,
      'areaOfInterest2': areaOfInterest2,
      'uId': uId
    };
  }

  factory CsrEntry.fromMap(Map<String, dynamic> map) {
    return CsrEntry(map['others'], map['areaOfInterest1'],
        map['areaOfInterest2'], map['uId']);
  }
}
