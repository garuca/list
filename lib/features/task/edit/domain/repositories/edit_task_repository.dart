import 'package:dartz/dartz.dart' as dartz;
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/edit/domain/errors/edit_errors.dart';

abstract class EditTaskRepository {
  Future<dartz.Either<EditTaskFailure, Task>> editTask(Task task);
}
