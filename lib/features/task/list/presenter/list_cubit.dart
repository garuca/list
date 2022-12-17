import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:list/features/task/list/domain/use_cases/list_task.dart';
import 'package:list/features/task/list/presenter/list_state.dart';

class ListCubit extends Cubit<ListState> {
  final ListTask? listTask;
  late CancelableOperation cancelable;

  ListCubit(this.listTask) : super(const StartState()) {
    cancelable = CancelableOperation.fromFuture(listTask!.call());
    execute();
  }

  Future<ListState> execute() async {
    final response = await listTask!();
    final result = response.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
    emit(result);
    return result;
  }
}
