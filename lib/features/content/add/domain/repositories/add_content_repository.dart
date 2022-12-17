import 'package:dartz/dartz.dart';
import 'package:list/common/domain/entities/content.dart';
import 'package:list/features/content/add/domain/errors/add_errors.dart';

abstract class AddContentRepository {
  Future<Either<AddContentFailure, Content>> addContent(Content content);
}
