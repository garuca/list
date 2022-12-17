import 'package:dartz/dartz.dart';
import 'package:list/common/data/models/content_model.dart';
import 'package:list/common/domain/entities/content.dart';
import 'package:list/features/content/add/data/data_source/add_content_data_source.dart';
import 'package:list/features/content/add/domain/errors/add_errors.dart';
import 'package:list/features/content/add/domain/repositories/add_content_repository.dart';


class AddContentRepositoryImpl implements AddContentRepository {
  final AddContentDataSource dataSource;

  AddContentRepositoryImpl(this.dataSource);

  @override
  Future<Either<AddContentFailure, ContentModel>> addContent(Content content) async {
    try {
      final result = await dataSource.addContent(content);
      return Right(result!);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
