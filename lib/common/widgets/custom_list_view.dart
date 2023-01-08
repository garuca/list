import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListView extends StatelessWidget {
  final List list;
  const CustomListView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: GestureDetector(
                child: Text("${list[i].text}"),
                onTap: () {
                  context.goNamed('edit', params: {
                    'id': "${list[i].id}",
                    'text': "${list[i].text}"
                  });
                }),
          );
        });
  }
}
