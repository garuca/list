import 'package:dartz/dartz.dart' as dartz;
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/edit/domain/errors/edit_errors.dart';
import 'package:list/features/task/edit/domain/repositories/edit_task_repository.dart';

abstract class EditTask {
  Future<dartz.Either<EditTaskFailure, Task>> call(Task task);
}

class EditTaskImpl implements EditTask {
  final EditTaskRepository repository;

  EditTaskImpl(this.repository);

  @override
  Future<dartz.Either<EditTaskFailure, Task>> call(Task task) async {
    return repository.editTask(task);
  }
}
