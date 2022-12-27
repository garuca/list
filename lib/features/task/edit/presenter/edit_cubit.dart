import 'package:bloc/bloc.dart';
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/edit/domain/use_cases/edit_task.dart';
import 'package:list/features/task/edit/presenter/edit_state.dart';

class EditCubit extends Cubit<EditState> {
  final EditTask? editTask;

  EditCubit(this.editTask) : super(const StartState()) {
    emit(const StartState());
  }

  Future<EditState> execute(Task task) async {
    final response = await editTask!(task);
    final result = response.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
    emit(result);
    return result;
  }
}
