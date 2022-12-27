import 'package:dartz/dartz.dart' as dartz;
import 'package:list/common/data/models/task_model.dart';
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/add/data/data_source/add_task_data_source.dart';
import 'package:list/features/task/add/domain/errors/add_errors.dart';
import 'package:list/features/task/add/domain/repositories/add_task_repository.dart';

class AddTaskRepositoryImpl implements AddTaskRepository {
  final AddTaskDataSource dataSource;

  AddTaskRepositoryImpl(this.dataSource);

  @override
  Future<dartz.Either<AddTaskFailure, TaskModel>> addTask(Task task) async {
    try {
      final result = await dataSource.addTask(task);
      return dartz.Right(result!);
    } catch (e) {
      return dartz.Left(DataSourceError());
    }
  }
}
