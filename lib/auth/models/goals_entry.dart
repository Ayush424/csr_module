import 'package:cloud_firestore/cloud_firestore.dart';

class GoalsEntry {
  final String goal;
  final String days;
  final String others;
  final bool completed;
  final Timestamp startDate;

  GoalsEntry(this.goal, this.days, this.others, this.completed, this.startDate);

  Map<String, dynamic> toMap() {
    return {
      'goal': goal,
      'days': days,
      'others': others,
      'completed': completed,
      'startDate': startDate
    };
  }

  factory GoalsEntry.fromMap(Map<String, dynamic> map) {
    return GoalsEntry(map['goal'], map['days'], map['others'], map['completed'],
        map['startDate']);
  }
}
