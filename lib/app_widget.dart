import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:list/features/content/list/presenter/ui/list_page.dart';

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
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
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
}
