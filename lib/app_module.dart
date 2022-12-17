import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:list/common/data/models/task_model.dart';
import 'package:list/features/task/add/data/data_source/add_task_data_source.dart';
import 'package:list/features/task/add/data/data_source/add_task_data_source_impl.dart';
import 'package:list/features/task/add/data/repositories/add_task_repository_impl.dart';
import 'package:list/features/task/add/domain/repositories/add_task_repository.dart';
import 'package:list/features/task/add/domain/use_cases/add_task.dart';
import 'package:list/features/task/add/presenter/add_cubit.dart';
import 'package:list/features/task/list/data/data_source/task_data_source.dart';
import 'package:list/features/task/list/data/data_source/task_data_source_impl.dart';
import 'package:list/features/task/list/data/repositories/task_repository_impl.dart';
import 'package:list/features/task/list/domain/repositories/task_repository.dart';
import 'package:list/features/task/list/domain/use_cases/list_task.dart';
import 'package:list/features/task/list/presenter/list_cubit.dart';

final sl = GetIt.I;

startModule([Dio? dio]) {
  sl.registerFactory<ListTask>(
      () => ListTaskImpl(sl<TaskRepository>()));
  sl.registerFactory<TaskRepository>(
      () => TaskRepositoryImpl(sl<TaskDataSource>()));
  sl.registerFactory<TaskDataSource>(() => TaskDataSourceImpl(sl()));
  sl.registerFactory(() => dio ?? Dio());
  sl.registerLazySingleton(() => ListCubit(sl<ListTask>()));
  sl.registerFactory<List<TaskModel>>(() => <TaskModel>[]);

  sl.registerFactory<AddTask>(
          () => AddTaskImpl(sl<AddTaskRepository>()));
  sl.registerFactory<AddTaskRepository>(
          () => AddTaskRepositoryImpl(sl<AddTaskDataSource>()));
  sl.registerFactory<AddTaskDataSource>(() => AddTaskDataSourceImpl(sl()));
  sl.registerFactory(() => AddCubit(sl<AddTask>()));
  sl.registerFactory<TaskModel>(() => TaskModel());

}

disposeModule() {
  sl.get<ListCubit>().close();
  sl.unregister<ListCubit>();
}
