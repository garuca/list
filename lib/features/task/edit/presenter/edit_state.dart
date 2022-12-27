import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/edit/domain/errors/edit_errors.dart';

abstract class EditState {}

class StartState implements EditState {
  const StartState();
}

class LoadingState implements EditState {
  const LoadingState();
}

class ErrorState implements EditState {
  final EditTaskFailure error;
  const ErrorState(this.error);
}

class SuccessState implements EditState {
  final Task task;
  const SuccessState(this.task);
}
