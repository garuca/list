import 'package:dartz/dartz.dart' as dartz;
import 'package:list/common/data/models/task_model.dart';
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/edit/data/data_source/edit_task_data_source.dart';
import 'package:list/features/task/edit/domain/errors/edit_errors.dart';
import 'package:list/features/task/edit/domain/repositories/edit_task_repository.dart';


class EditTaskRepositoryImpl implements EditTaskRepository {
  final EditTaskDataSource dataSource;

  EditTaskRepositoryImpl(this.dataSource);

  @override
  Future<dartz.Either<EditTaskFailure, TaskModel>> editTask(Task task) async {
    try {
      final result = await dataSource.editTask(task);
      return dartz.Right(result!);
    } catch (e) {
      return dartz.Left(DataSourceError());
    }
  }
}
