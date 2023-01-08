import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list/common/data/models/task_model.dart';
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/add/data/data_source/add_task_data_source.dart';

class AddTaskDataSourceImpl implements AddTaskDataSource {
  final CollectionReference taskCollection;

  AddTaskDataSourceImpl(this.taskCollection);

  @override
  Future<TaskModel> addTask(Task task) async {
    final response = await taskCollection.add({
      'text': task.text,
      'last_updated':FieldValue.serverTimestamp(),
      'created':FieldValue.serverTimestamp(),

    });
    task.id = response.id;
    return TaskModel(id: task.id, text: task.text);
  }
}
