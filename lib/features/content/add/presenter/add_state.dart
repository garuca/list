import 'package:list/common/domain/entities/content.dart';
import 'package:list/features/content/add/domain/errors/add_errors.dart';

abstract class AddState {}

class StartState implements AddState {
  const StartState();
}

class LoadingState implements AddState {
  const LoadingState();
}

class ErrorState implements AddState {
  final AddContentFailure error;
  const ErrorState(this.error);
}

class SuccessState implements AddState {
  final Content content;
  const SuccessState(this.content);
}
