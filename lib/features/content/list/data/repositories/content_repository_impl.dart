import 'package:dartz/dartz.dart';
import 'package:list/common/data/models/content_model.dart';
import 'package:list/features/content/list/data/data_source/content_data_source.dart';
import 'package:list/features/content/list/domain/errors/errors.dart';
import 'package:list/features/content/list/domain/repositories/content_repository.dart';

class ContentRepositoryImpl implements ContentRepository {
  final ContentDataSource dataSource;

  ContentRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<ContentModel>?>> list() async {
    try {
      final result = await dataSource.getContents();
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
