import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:list/common/domain/entities/task.dart';
import 'package:list/features/task/add/presenter/ui/list_loading_page.dart';
import 'package:list/features/task/edit/domain/use_cases/edit_task.dart';
import 'package:list/features/task/edit/presenter/edit_cubit.dart';
import 'package:list/features/task/edit/presenter/edit_state.dart';
import 'package:list/features/task/list/presenter/list_cubit.dart';
import 'package:go_router/go_router.dart';

class EditPage extends StatefulWidget {
  final String id;
  final String text;
  const EditPage({super.key,required this.id,required this.text});

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
    Future nav() async {
      await BlocProvider.of<ListCubit>(context, listen: true).execute();
      context.pop();
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
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: textController,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Builder(
                        builder: (context) {
                          return TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(Colors.blue),
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered)) {
                                      return Colors.blue.withOpacity(0.04);
                                    }
                                    if (states.contains(MaterialState.focused) ||
                                        states.contains(MaterialState.pressed)) {
                                      return Colors.blue.withOpacity(0.12);
                                    }
                                    return null; // Defer to the widget's default.
                                  },
                                ),
                              ),
                              onPressed: () {
                                cubit.execute(

                                    Task(id: widget.id, text: textController.text));
                              },
                              child: const Text('TextButton'));
                        }
                      )),
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
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
