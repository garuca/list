import 'package:flutter_test/flutter_test.dart';
import 'package:list/common/data/models/task_model.dart';
import 'package:list/features/task/list/data/data_source/task_data_source.dart';
import 'package:list/features/task/list/data/repositories/task_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'task_repository_impl_test.mocks.dart';

@GenerateMocks([TaskDataSource])
main() {
  final dataSource = MockTaskDataSource();
  final repository = TaskRepositoryImpl(dataSource);

  test('Return list result', () async {
    when(dataSource.getTasks()).thenAnswer((_) async => <TaskModel>[]);
    final result = await repository.list();
    expect(result | null, isA<List<TaskModel>>());
  });
}
