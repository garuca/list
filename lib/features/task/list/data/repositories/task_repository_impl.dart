import 'package:dartz/dartz.dart';
import 'package:list/common/data/models/task_model.dart';
import 'package:list/features/task/list/data/data_source/task_data_source.dart';
import 'package:list/features/task/list/domain/errors/errors.dart';
import 'package:list/features/task/list/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource dataSource;

  TaskRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<TaskModel>?>> list() async {
    try {
      final result = await dataSource.getTasks();
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
