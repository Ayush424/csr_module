import 'package:cloud_firestore/cloud_firestore.dart';

class AssistanceEntry {
  final String category;
  final String content;
  final Timestamp date;
  final String? postedBy;

  AssistanceEntry(this.category, this.content, this.date, this.postedBy);

  String convertpostedyBy(postedBy) {
    if (postedBy == null) {
      return "";
    } else
      return postedBy;
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'content': content,
      'date': date,
      'postedBy': postedBy
    };
  }

  factory AssistanceEntry.fromMap(Map<String, dynamic> map) {
    return AssistanceEntry(
        map['category'], map['content'], map['date'], map['postedBy']);
  }
}
