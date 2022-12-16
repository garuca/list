import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:list/common/data/models/content_model.dart';
import 'package:list/features/content/list/data/data_source/content_data_source.dart';

class ContentDataSourceImpl implements ContentDataSource {
  final Dio dio;

  ContentDataSourceImpl(this.dio);

  @override
  Future<List<ContentModel>?> getContents() async {
    try {
      final response =
          await FirebaseFirestore.instance.collection('content').get();
      return response.docs.map((e) => ContentModel.fromObject(e)).toList();
    } catch (e) {}
    return null;
  }
}
