import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list/common/widgets/custom_list_view.dart';
import 'package:list/features/task/search/presenter/ui/search_loading_page.dart';
import 'package:list/features/task/search/presenter/search_cubit.dart';
import 'package:list/features/task/search/presenter/search_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: SizedBox(
              height: 54,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Digite a tarefa desejada",
                    fillColor: Colors.white70),
                controller: _controller,
                onChanged: (text) {
                  context.read<SearchCubit>().search(text);
                },
              ),
            ),
          ),
          BlocBuilder<SearchCubit, SearchState>(
              builder: (builderContext, state) {
            if (state is StartState) {
              return Container();
            } else if (state is LoadingState) {
              return const Expanded(child: FeedLoadingPage());
            } else if (state is SuccessState) {
              return Expanded(child: CustomListView(list: state.list ?? []));
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
