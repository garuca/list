import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/search/domain/errors/search_errors.dart';

abstract class SearchState {}

class StartState implements SearchState {
  const StartState();
}

class LoadingState implements SearchState {
  const LoadingState();
}

class ErrorState implements SearchState {
  final SearchFailure error;
  const ErrorState(this.error);
}

class SuccessState implements SearchState {
  final List<Task>? list;
  const SuccessState(this.list);
}
