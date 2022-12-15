import 'package:dartz/dartz.dart';
import 'package:list/common/domain/entities/content.dart';
import 'package:list/features/content/list/domain/errors/errors.dart';

abstract class ContentRepository {
  Future<Either<Failure, List<Content>?>> list();
}
