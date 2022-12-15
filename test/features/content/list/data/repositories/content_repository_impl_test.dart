import 'package:flutter_test/flutter_test.dart';
import 'package:list/common/data/models/content_model.dart';
import 'package:list/features/content/list/data/data_source/content_data_source.dart';
import 'package:list/features/content/list/data/repositories/content_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'content_repository_impl_test.mocks.dart';

@GenerateMocks([ContentDataSource])
main() {
  final dataSource = MockContentDataSource();
  final repository = ContentRepositoryImpl(dataSource);

  test('Return list result', () async {
    when(dataSource.getContents()).thenAnswer((_) async => <ContentModel>[]);
    final result = await repository.list();
    expect(result | null, isA<List<ContentModel>>());
  });
}
