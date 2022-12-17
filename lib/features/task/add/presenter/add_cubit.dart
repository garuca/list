import 'package:bloc/bloc.dart';
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/add/domain/use_cases/add_task.dart';
import 'package:list/features/task/add/presenter/add_state.dart';

class AddCubit extends Cubit<AddState> {
  final AddTask? addTask;

  AddCubit(this.addTask) : super(const StartState()) {
    emit(const StartState());
  }

  Future<AddState> execute(Task task) async {
    final response = await addTask!(task);
    final result = response.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
    emit(result);
    return result;
  }
}
