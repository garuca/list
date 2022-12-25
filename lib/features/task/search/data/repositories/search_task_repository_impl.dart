import 'package:dartz/dartz.dart';
import 'package:list/common/data/models/task_model.dart';
import 'package:list/features/task/search/data/data_source/search_task_data_source.dart';
import 'package:list/features/task/search/domain/errors/search_errors.dart';
import 'package:list/features/task/search/domain/repositories/search_repository.dart';

class SearchTaskRepositoryImpl implements SearchTaskRepository {
  final SearchDataSource dataSource;

  SearchTaskRepositoryImpl(this.dataSource);

  @override
  Future<Either<SearchFailure, List<TaskModel>?>> list(String? word) async {
    try {
      final result = await dataSource.getTasks(word);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
