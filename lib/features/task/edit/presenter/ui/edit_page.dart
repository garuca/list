import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:list/common/domain/entities/task.dart';
import 'package:list/common/widgets/custom_text_field.dart';
import 'package:list/common/widgets/primary_text_button.dart';
import 'package:list/features/task/add/presenter/ui/list_loading_page.dart';
import 'package:list/features/task/edit/domain/use_cases/edit_task.dart';
import 'package:list/features/task/edit/presenter/edit_cubit.dart';
import 'package:list/features/task/edit/presenter/edit_state.dart';
import 'package:list/features/task/list/presenter/list_cubit.dart';
import 'package:go_router/go_router.dart';

class EditPage extends StatefulWidget {
  final String id;
  final String text;
  const EditPage({super.key, required this.id, required this.text});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final textController = TextEditingController();
  final sl = GetIt.I;
  late final EditCubit cubit;
  @override
  void initState() {
    textController.text = widget.text;
    cubit = EditCubit(sl<EditTask>());
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    nav() {
      BlocProvider.of<ListCubit>(context, listen: true).execute();

      Future.delayed(Duration.zero, () async {
        context.pop();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: BlocBuilder<EditCubit, EditState>(
          bloc: cubit,
          builder: (builderContext, state) {
            if (state is StartState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 40, left: 40),
                    child: CustomTextField(
                      controller: textController,
                      text: 'Tarefa',
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Builder(builder: (context) {
                        return PrimaryTextButton(
                          text: 'Concluir Edição',
                          onPressed: () {
                            cubit.execute(
                                Task(id: widget.id, text: textController.text));
                          },
                        );
                      })),
                ],
              );
            } else if (state is LoadingState) {
              return const Center(
                child: FeedLoadingPage(),
              );
            } else if (state is SuccessState) {
              nav();

              return Container();
            } else {
              return Container();
            }
          }),
    );
  }
}
