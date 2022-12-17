import 'package:list/common/data/models/content_model.dart';
import 'package:list/common/domain/entities/content.dart';

abstract class AddContentDataSource {
  Future<ContentModel?> addContent(Content content);
}
