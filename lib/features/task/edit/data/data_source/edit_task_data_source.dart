import 'package:list/common/data/models/task_model.dart';
import 'package:list/common/domain/entities/task.dart';

abstract class EditTaskDataSource {
  Future<TaskModel?> editTask(Task task);
}
