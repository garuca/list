import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/add/domain/errors/add_errors.dart';

abstract class AddState {}

class StartState implements AddState {
  const StartState();
}

class LoadingState implements AddState {
  const LoadingState();
}

class ErrorState implements AddState {
  final AddTaskFailure error;
  const ErrorState(this.error);
}

class SuccessState implements AddState {
  final Task task;
  const SuccessState(this.task);
}
