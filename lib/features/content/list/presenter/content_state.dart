import 'package:list/common/domain/entities/content.dart';
import 'package:list/features/content/list/domain/errors/errors.dart';

abstract class ContentState {}

class StartState implements ContentState {
  const StartState();
}

class LoadingState implements ContentState {
  const LoadingState();
}

class ErrorState implements ContentState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements ContentState {
  final List<Content>? list;
  const SuccessState(this.list);
}
