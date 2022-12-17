import 'package:bloc/bloc.dart';
import 'package:list/common/domain/entities/content.dart';
import 'package:list/features/content/add/domain/use_cases/add_content.dart';
import 'package:list/features/content/add/presenter/add_state.dart';

class AddCubit extends Cubit<AddState> {
  final AddContent? addContent;

  AddCubit(this.addContent) : super(const StartState()) {
    emit(const StartState());
  }

  Future<AddState> execute(Content content) async {
    final response = await addContent!(content);
    final result = response.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
    emit(result);
    return result;
  }
}
