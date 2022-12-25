import 'package:dartz/dartz.dart' as dartz;
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/search/domain/errors/search_errors.dart';
import 'package:list/features/task/search/domain/repositories/search_repository.dart';

abstract class SearchListTask {
  Future<dartz.Either<SearchFailure, List<Task>?>> call(String? word);
}

class SearchListTaskImpl implements SearchListTask {
  final SearchTaskRepository repository;

  SearchListTaskImpl(this.repository);

  @override
  Future<dartz.Either<SearchFailure, List<Task>?>> call(String? word) async {
    return repository.list(word);
  }
}
