import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list/common/widgets/custom_list_view.dart';
import 'package:list/features/task/list/presenter/list_cubit.dart';
import 'package:list/features/task/list/presenter/list_state.dart';
import 'package:go_router/go_router.dart';
import 'package:list/features/task/list/presenter/ui/list_loading_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({
    super.key,
  });

  @override
  State<ListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              context.go('/search');
            },
          )
        ],
      ),
      body: BlocBuilder<ListCubit, ListState>(builder: (builderContext, state) {
        if (state is StartState) {
          return const Center(
            child: ListLoadingPage(),
          );
        } else if (state is LoadingState) {
          return const Center(
            child: ListLoadingPage(),
          );
        } else if (state is SuccessState) {
          return ListView.builder(
              itemCount: state.list!.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: GestureDetector(
                      child: Text("${state.list![i].text}"),
                      onTap: () {
                        context.goNamed('edit', params: {
                          'id': "${state.list![i].id}",
                          'text': "${state.list![i].text}"
                        });
                      }),
                );
              });
        } else {
          return Container();
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/add');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
