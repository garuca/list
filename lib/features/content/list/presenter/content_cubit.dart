import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:list/features/content/list/domain/use_cases/list_content.dart';
import 'package:list/features/content/list/presenter/content_state.dart';

class ContentCubit extends Cubit<ContentState> {
  final ListContent? listContent;
  late CancelableOperation cancelable;

  ContentCubit(this.listContent) : super(const StartState()) {
    cancelable = CancelableOperation.fromFuture(listContent!.call());
    execute();
  }

  Future<ContentState> execute() async {
    final response = await listContent!();
    final result = response.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
    emit(result);
    return result;
  }
}
