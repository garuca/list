import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list/common/data/models/task_model.dart';
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/edit/data/data_source/edit_task_data_source.dart';

class EditTaskDataSourceImpl implements EditTaskDataSource {
  final CollectionReference taskCollection;

  EditTaskDataSourceImpl(this.taskCollection);

  @override
  Future<TaskModel?> editTask(Task task) async {
    await taskCollection.doc(task.id).update({'text': task.text});
    return TaskModel(id: task.id, text: task.text);
  }
}
