import 'package:dartz/dartz.dart' as dartz;
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/add/domain/errors/add_errors.dart';

abstract class AddTaskRepository {
  Future<dartz.Either<AddTaskFailure, Task>> addTask(Task task);
}
