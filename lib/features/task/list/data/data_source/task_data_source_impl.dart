import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list/common/data/models/task_model.dart';
import 'package:list/features/task/list/data/data_source/task_data_source.dart';

class TaskDataSourceImpl implements TaskDataSource {
  final CollectionReference taskCollection;

  TaskDataSourceImpl(this.taskCollection);

  @override
  Future<List<TaskModel>?> getTasks() async {
    final response = await taskCollection.get();
    return response.docs.map((e) => TaskModel.fromObject(e)).toList();
  }
}
