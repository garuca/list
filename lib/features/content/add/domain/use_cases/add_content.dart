import 'package:dartz/dartz.dart';
import 'package:list/common/domain/entities/content.dart';
import 'package:list/features/content/add/domain/errors/add_errors.dart';
import 'package:list/features/content/add/domain/repositories/add_content_repository.dart';

abstract class AddContent {
  Future<Either<AddContentFailure, Content>> call(Content content);
}

class AddContentImpl implements AddContent {
  final AddContentRepository repository;

  AddContentImpl(this.repository);

  @override
  Future<Either<AddContentFailure, Content>> call(Content content) async {
    return repository.addContent(content);
  }
}
