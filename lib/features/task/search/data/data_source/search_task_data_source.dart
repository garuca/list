import 'package:list/common/data/models/task_model.dart';

abstract class SearchDataSource {
  Future<List<TaskModel>?> getTasks(String? word);
}
