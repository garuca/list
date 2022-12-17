import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:list/features/content/list/domain/use_cases/list_content.dart';
import 'package:list/features/content/list/presenter/list_state.dart';

class ListCubit extends Cubit<ListState> {
  final ListContent? listContent;
  late CancelableOperation cancelable;

  ListCubit(this.listContent) : super(const StartState()) {
    cancelable = CancelableOperation.fromFuture(listContent!.call());
    execute();
  }

  Future<ListState> execute() async {
    final response = await listContent!();
    final result = response.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
    emit(result);
    return result;
  }
}
