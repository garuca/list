import 'package:list/common/data/models/content_model.dart';

abstract class ContentDataSource {
  Future<List<ContentModel>?> getContents();
}
