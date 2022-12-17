import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:list/common/data/models/task_model.dart';
import 'package:list/features/task/list/data/data_source/task_data_source.dart';

class TaskDataSourceImpl implements TaskDataSource {
  final Dio dio;

  TaskDataSourceImpl(this.dio);

  @override
  Future<List<TaskModel>?> getTasks() async {
    try {
      final response =
          await FirebaseFirestore.instance.collection('task').get();
      return response.docs.map((e) => TaskModel.fromObject(e)).toList();
    } catch (e) {}
    return null;
  }
}
