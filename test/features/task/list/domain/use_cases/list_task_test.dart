import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter_test/flutter_test.dart';
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/list/domain/errors/errors.dart';
import 'package:list/features/task/list/domain/repositories/task_repository.dart';
import 'package:list/features/task/list/domain/use_cases/list_task.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'list_task_test.mocks.dart';

@GenerateMocks([TaskRepository])
main() {
  final repository = MockTaskRepository();
  final useCase = ListTaskImpl(repository);

  test("Scenery 1 Return list of tasks", () async {
    when(repository.list()).thenAnswer((_) async => const dartz.Right(<Task>[]));
    final result = await useCase();
    expect(result | null, isA<List<Task>?>());
  });
  test("Scenery 2 Return list empty list", () async {
    when(repository.list()).thenAnswer((_) async => dartz.Left(EmptyList()));
    final response = await useCase();
    final result = response.fold(
      (failure) => failure,
      (success) => const dartz.Right(<Task>[]),
    );
    expect(result, isInstanceOf<EmptyList>());
  });
}
