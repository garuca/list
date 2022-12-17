import 'package:dartz/dartz.dart' as dartz;
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/list/domain/errors/errors.dart';

abstract class TaskRepository {
  Future<dartz.Either<Failure, List<Task>?>> list();
}
