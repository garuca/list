import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:list/common/data/models/task_model.dart';
import 'package:list/features/task/add/data/data_source/add_task_data_source.dart';
import 'package:list/features/task/add/data/data_source/add_task_data_source_impl.dart';
import 'package:list/features/task/add/data/repositories/add_task_repository_impl.dart';
import 'package:list/features/task/add/domain/repositories/add_task_repository.dart';
import 'package:list/features/task/add/domain/use_cases/add_task.dart';
import 'package:list/features/task/add/presenter/add_cubit.dart';
import 'package:list/features/task/edit/data/data_source/edit_task_data_source.dart';
import 'package:list/features/task/edit/data/data_source/edit_task_data_source_impl.dart';
import 'package:list/features/task/edit/domain/repositories/edit_task_repository.dart';
import 'package:list/features/task/edit/domain/use_cases/edit_task.dart';
import 'package:list/features/task/edit/presenter/edit_cubit.dart';
import 'package:list/features/task/list/data/data_source/task_data_source.dart';
import 'package:list/features/task/list/data/data_source/task_data_source_impl.dart';
import 'package:list/features/task/list/data/repositories/task_repository_impl.dart';
import 'package:list/features/task/list/domain/repositories/task_repository.dart';
import 'package:list/features/task/list/domain/use_cases/list_task.dart';
import 'package:list/features/task/list/presenter/list_cubit.dart';
import 'package:list/features/task/search/data/data_source/search_task_data_source.dart';
import 'package:list/features/task/search/data/data_source/search_task_data_source_impl.dart';
import 'package:list/features/task/search/data/repositories/search_task_repository_impl.dart';
import 'package:list/features/task/search/domain/repositories/search_repository.dart';
import 'package:list/features/task/search/domain/use_cases/search_list_task.dart';
import 'package:list/features/task/search/presenter/search_cubit.dart';
import 'features/task/edit/data/repositories/edit_task_repository_impl.dart';

final sl = GetIt.I;

startModule([CollectionReference? taskCollection]) {
  sl.registerFactory<ListTask>(
      () => ListTaskImpl(sl<TaskRepository>()));
  sl.registerFactory<TaskRepository>(
      () => TaskRepositoryImpl(sl<TaskDataSource>()));
  sl.registerFactory<TaskDataSource>(() => TaskDataSourceImpl(sl()));
  sl.registerFactory(() => taskCollection ?? FirebaseFirestore.instance.collection('task'));
  sl.registerLazySingleton(() => ListCubit(sl<ListTask>()));
  sl.registerFactory<List<TaskModel>>(() => <TaskModel>[]);

  sl.registerFactory<AddTask>(
          () => AddTaskImpl(sl<AddTaskRepository>()));
  sl.registerFactory<AddTaskRepository>(
          () => AddTaskRepositoryImpl(sl<AddTaskDataSource>()));
  sl.registerFactory<AddTaskDataSource>(() => AddTaskDataSourceImpl(sl()));
  sl.registerFactory(() => AddCubit(sl<AddTask>()));
  sl.registerFactory<TaskModel>(() => TaskModel());

  sl.registerFactory<SearchListTask>(
          () => SearchListTaskImpl(sl<SearchTaskRepository>()));
  sl.registerFactory<SearchTaskRepository>(
          () => SearchTaskRepositoryImpl(sl<SearchDataSource>()));
  sl.registerFactory<SearchDataSource>(() => SearchDataSourceImpl(sl()));
  sl.registerFactory(() => SearchCubit(sl<SearchListTask>()));

  sl.registerFactory<EditTask>(
          () => EditTaskImpl(sl<EditTaskRepository>()));
  sl.registerFactory<EditTaskRepository>(
          () => EditTaskRepositoryImpl(sl<EditTaskDataSource>()));
  sl.registerFactory<EditTaskDataSource>(() => EditTaskDataSourceImpl(sl()));
  sl.registerFactory(() => EditCubit(sl<EditTask>()));


}

disposeModule() {
  sl.get<ListCubit>().close();
  sl.unregister<ListCubit>();
}
