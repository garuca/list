import 'package:dartz/dartz.dart' as dartz;
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/add/domain/errors/add_errors.dart';
import 'package:list/features/task/add/domain/repositories/add_task_repository.dart';

abstract class AddTask {
  Future<dartz.Either<AddTaskFailure, Task>> call(Task task);
}

class AddTaskImpl implements AddTask {
  final AddTaskRepository repository;

  AddTaskImpl(this.repository);

  @override
  Future<dartz.Either<AddTaskFailure, Task>> call(Task task) async {
    return repository.addTask(task);
  }
}
