import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list/common/domain/entities/task.dart';

class TaskModel implements Task {
  @override
  String? id;
  @override
  String? text;

  TaskModel({
    this.id,
    this.text,
  });

  TaskModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }
  TaskModel.fromObject(QueryDocumentSnapshot queryDocumentSnapshot) {
    id = queryDocumentSnapshot.id;
    text = queryDocumentSnapshot['text'];
  }
}
