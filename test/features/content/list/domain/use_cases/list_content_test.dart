import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:list/common/domain/entities/content.dart';
import 'package:list/features/content/list/domain/errors/errors.dart';
import 'package:list/features/content/list/domain/repositories/content_repository.dart';
import 'package:list/features/content/list/domain/use_cases/list_content.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'list_content_test.mocks.dart';

@GenerateMocks([ContentRepository])
main() {
  final repository = MockContentRepository();
  final useCase = ListContentImpl(repository);

  test("Scenery 1 Return list of Cars", () async {
    when(repository.list()).thenAnswer((_) async => const Right(<Content>[]));
    final result = await useCase();
    expect(result | null, isA<List<Content>?>());
  });
  test("Scenery 2 Return list empty list", () async {
    when(repository.list()).thenAnswer((_) async => Left(EmptyList()));
    final response = await useCase();
    final result = response.fold(
      (failure) => EmptyList(),
      (success) => const Right(<Content>[]),
    );
    expect(result, isInstanceOf<EmptyList>());
  });
}
