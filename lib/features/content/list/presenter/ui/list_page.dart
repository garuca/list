import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list/features/content/list/presenter/content_cubit.dart';
import 'package:list/features/content/list/presenter/content_state.dart';
import 'package:list/features/content/list/presenter/ui/list_loading_page.dart';

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
      body: BlocBuilder<ContentCubit, ContentState>(builder: (context, state) {
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
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
