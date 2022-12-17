import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:list/app_widget.dart';
import 'package:list/features/task/add/presenter/add_cubit.dart';
import 'package:list/features/task/list/domain/use_cases/list_task.dart';
import 'package:list/features/task/list/presenter/list_cubit.dart';
import 'package:list/firebase_options.dart';

void main() {
  final sl = GetIt.I;
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ListCubit>(
        create: (BuildContext context) => ListCubit(sl<ListTask>()),
      ),
    ],
    child: const AppWidget(),
  ));
}
