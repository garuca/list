import 'package:list/common/data/models/task_model.dart';
import 'package:list/common/domain/entities/task.dart';

abstract class AddTaskDataSource {
  Future<TaskModel?> addTask(Task task);
}
