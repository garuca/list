import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list/common/domain/entities/task.dart';

class TaskModel implements Task {
  @override
  String? id;
  @override
  String? text;
  @override
  DateTime? lastUpdate;
  @override
  DateTime? created;

  TaskModel({this.id, this.text, this.lastUpdate});

  TaskModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    lastUpdate = DateTime.fromMillisecondsSinceEpoch(json['last_updated']);
  }
  TaskModel.fromObject(QueryDocumentSnapshot queryDocumentSnapshot) {
    id = queryDocumentSnapshot.id;
    text = queryDocumentSnapshot['text'];
    Timestamp timestamp = queryDocumentSnapshot['last_updated'];
    Timestamp timestampCreated = queryDocumentSnapshot['created'];
    lastUpdate = timestamp.toDate();
    created = timestampCreated.toDate();
  }
}
