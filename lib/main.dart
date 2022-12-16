import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:list/app_widget.dart';
import 'package:list/features/content/list/domain/use_cases/list_content.dart';
import 'package:list/features/content/list/presenter/content_cubit.dart';
import 'package:list/firebase_options.dart';

void main() {
  final sl = GetIt.I;
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ContentCubit>(
        create: (BuildContext context) => ContentCubit(sl<ListContent>()),
      ),
    ],
    child: const AppWidget(),
  ));
}
