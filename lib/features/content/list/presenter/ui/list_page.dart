import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list/features/content/list/presenter/list_cubit.dart';
import 'package:list/features/content/list/presenter/list_state.dart';
import 'package:list/features/content/list/presenter/ui/list_loading_page.dart';
import 'package:go_router/go_router.dart';
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
        title: Text(""),
      ),
      body: BlocBuilder<ListCubit, ListState>(builder: (builderContext, state) {
        if (state is StartState) {
          return const Center(
            child: FeedLoadingPage(),
          );
        } else if (state is LoadingState) {
          return const Center(
            child: FeedLoadingPage(),
          );
        } else if (state is SuccessState) {
          return ListView.builder(
              itemCount: state.list!.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text("${state.list![i].text}"),
                );
              });
        } else {
          return Container();
        }
      }),
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
          context.go('/add');},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
