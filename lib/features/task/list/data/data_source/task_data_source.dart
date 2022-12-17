import 'package:list/common/data/models/task_model.dart';

abstract class TaskDataSource {
  Future<List<TaskModel>?> getTasks();
}
