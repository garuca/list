import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/list/domain/errors/errors.dart';

abstract class ListState {}

class StartState implements ListState {
  const StartState();
}

class LoadingState implements ListState {
  const LoadingState();
}

class ErrorState implements ListState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements ListState {
  final List<Task>? list;
  const SuccessState(this.list);
}
