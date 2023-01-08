import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:list/features/task/search/domain/use_cases/search_list_task.dart';
import 'package:list/features/task/search/presenter/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchListTask searchListTask;

  late CancelableOperation cancelable;

  SearchCubit(this.searchListTask) : super(const StartState());

  Future<SearchState> execute(String textSearch) async {
    final response = await searchListTask(textSearch);
    final result = response.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
    return result;
  }

  Future<void> search(String textSearch) async {
    //await cancelable.cancel();

    if (textSearch.isEmpty || textSearch.trim() == '') {
      emit(const StartState());
      return;
    }
    emit(const LoadingState());
    cancelable = CancelableOperation.fromFuture(
        Future.delayed(const Duration(milliseconds: 1200)));
    await cancelable.value;
    if (cancelable.isCompleted) {
      emit(await execute(textSearch));
    }
  }
}
