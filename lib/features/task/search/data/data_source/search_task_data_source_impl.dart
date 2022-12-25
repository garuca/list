import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:list/common/data/models/task_model.dart';
import 'package:list/features/task/search/data/data_source/search_task_data_source.dart';

class SearchDataSourceImpl implements SearchDataSource {
  final Dio dio;

  SearchDataSourceImpl(this.dio);

  @override
  Future<List<TaskModel>?> getTasks(String? word) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('task')
          .where('text', isGreaterThanOrEqualTo: word)
          .get();
      return response.docs.map((e) => TaskModel.fromObject(e)).toList();
    } catch (e) {}
    return null;
  }
}
