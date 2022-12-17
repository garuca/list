import 'package:dartz/dartz.dart' as dartz;
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/list/domain/errors/errors.dart';
import 'package:list/features/task/list/domain/repositories/task_repository.dart';

abstract class ListTask {
  Future<dartz.Either<Failure, List<Task>?>> call();
}

class ListTaskImpl implements ListTask {
  final TaskRepository repository;

  ListTaskImpl(this.repository);

  @override
  Future<dartz.Either<Failure, List<Task>?>> call() async {
    return repository.list();
  }
}
