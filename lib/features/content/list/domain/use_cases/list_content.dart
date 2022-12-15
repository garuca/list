import 'package:dartz/dartz.dart';
import 'package:list/common/domain/entities/content.dart';
import 'package:list/features/content/list/domain/errors/errors.dart';
import 'package:list/features/content/list/domain/repositories/content_repository.dart';

abstract class ListContent {
  Future<Either<Failure, List<Content>?>> call();
}

class ListContentImpl implements ListContent {
  final ContentRepository repository;

  ListContentImpl(this.repository);

  @override
  Future<Either<Failure, List<Content>?>> call() async {
    return repository.list();
  }
}
