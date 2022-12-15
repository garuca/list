import 'package:dio/dio.dart';
import 'package:list/common/data/models/content_model.dart';
import 'package:list/features/content/list/data/data_source/content_data_source.dart';

class ContentDataSourceImpl implements ContentDataSource {
  final Dio dio;

  ContentDataSourceImpl(this.dio);

  @override
  Future<List<ContentModel>?> getContents() async {
    Response response = await dio
        .get('https://run.mocky.io/v3/ed738302-1e28-4597-abae-af583ffeae30');
    if (response.statusCode == 200) {
      final list =
          (response.data as List).map((e) => ContentModel.fromMap(e)).toList();
      return list;
    }
    return null;
  }
}
