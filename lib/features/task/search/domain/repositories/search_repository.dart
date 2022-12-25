import 'package:dartz/dartz.dart' as dartz;
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/search/domain/errors/search_errors.dart';


abstract class SearchTaskRepository {
  Future<dartz.Either<SearchFailure, List<Task>?>> list(String? word);
}
