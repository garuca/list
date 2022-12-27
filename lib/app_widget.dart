import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:list/features/task/add/presenter/ui/add_page.dart';
import 'package:list/features/task/edit/presenter/ui/edit_page.dart';
import 'package:list/features/task/list/presenter/ui/list_page.dart';

import 'app_module.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  AppWidgetState createState() => AppWidgetState();
}

class AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    startModule();
  }

  @override
  void dispose() {
    super.dispose();
    disposeModule();
  }

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const ListPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'add',
            builder: (BuildContext context, GoRouterState state) {
              return const AddPage();
            },
          ),
          GoRoute(
              path: 'edit/:id/:text',
              name: 'edit',
              builder: (BuildContext context, GoRouterState state) {
                return EditPage(
                    id: state.params['id']!, text: state.params['text']!);
              }),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter',
            theme: ThemeData(
              fontFamily: 'CircularStd',
              primarySwatch: Colors.blue,
            ),
            routerConfig: _router,
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
