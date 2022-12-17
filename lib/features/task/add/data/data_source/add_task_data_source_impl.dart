import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:list/common/data/models/task_model.dart';
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/add/data/data_source/add_task_data_source.dart';

class AddTaskDataSourceImpl implements AddTaskDataSource {
  final Dio dio;

  AddTaskDataSourceImpl(this.dio);

  @override
  Future<TaskModel?> addTask(Task task) async {
    CollectionReference taskColection =
        FirebaseFirestore.instance.collection('task');
    try {
      final response = await taskColection.add({
        'text': task.text,
      });
      task.id = response.id;
      return TaskModel(id: task.id, text: task.text);
    } catch (e) {}
    return null;
  }
}
