import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:list/common/data/models/content_model.dart';
import 'package:list/common/domain/entities/content.dart';
import 'package:list/features/content/add/data/data_source/add_content_data_source.dart';

class AddContentDataSourceImpl implements AddContentDataSource {
  final Dio dio;

  AddContentDataSourceImpl(this.dio);

  @override
  Future<ContentModel?> addContent(Content content) async {
    CollectionReference contentColection =
        FirebaseFirestore.instance.collection('content');
    try {
      final response = await contentColection.add({
        'text': content.text,
      });
      content.id = response.id;
      return ContentModel(id: content.id,text: content.text);
    } catch (e) {}
    return null;
  }
}
