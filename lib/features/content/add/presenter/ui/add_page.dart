import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:list/common/domain/entities/content.dart';
import 'package:list/features/content/add/domain/use_cases/add_content.dart';
import 'package:list/features/content/add/presenter/add_cubit.dart';
import 'package:list/features/content/add/presenter/add_state.dart';
import 'package:list/features/content/add/presenter/ui/list_loading_page.dart';
import 'package:list/features/content/list/presenter/list_cubit.dart';
import 'package:go_router/go_router.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    super.key,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final textController = TextEditingController();
  final sl = GetIt.I;
  late final AddCubit cubit;
  @override
  void initState() {
    cubit = AddCubit(sl<AddContent>());
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
      body: BlocBuilder<AddCubit, AddState>(
          bloc: cubit,
          builder: (builderContext, state) {
            if (state is StartState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term',
                      ),
                      controller: textController,
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextButton(
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
                            cubit.execute(Content(text: textController.text));
                          },
                          child: Text('TextButton'))),
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
