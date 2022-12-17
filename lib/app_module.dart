import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:list/common/data/models/content_model.dart';
import 'package:list/features/content/add/data/data_source/add_content_data_source.dart';
import 'package:list/features/content/add/data/data_source/add_content_data_source_impl.dart';
import 'package:list/features/content/add/data/repositories/add_content_repository_impl.dart';
import 'package:list/features/content/add/domain/repositories/add_content_repository.dart';
import 'package:list/features/content/add/domain/use_cases/add_content.dart';
import 'package:list/features/content/add/presenter/add_cubit.dart';
import 'package:list/features/content/list/data/data_source/content_data_source.dart';
import 'package:list/features/content/list/data/data_source/content_data_source_impl.dart';
import 'package:list/features/content/list/data/repositories/content_repository_impl.dart';
import 'package:list/features/content/list/domain/repositories/content_repository.dart';
import 'package:list/features/content/list/domain/use_cases/list_content.dart';
import 'package:list/features/content/list/presenter/list_cubit.dart';

final sl = GetIt.I;

startModule([Dio? dio]) {
  sl.registerFactory<ListContent>(
      () => ListContentImpl(sl<ContentRepository>()));
  sl.registerFactory<ContentRepository>(
      () => ContentRepositoryImpl(sl<ContentDataSource>()));
  sl.registerFactory<ContentDataSource>(() => ContentDataSourceImpl(sl()));
  sl.registerFactory(() => dio ?? Dio());
  sl.registerLazySingleton(() => ListCubit(sl<ListContent>()));
  sl.registerFactory<List<ContentModel>>(() => <ContentModel>[]);

  sl.registerFactory<AddContent>(
          () => AddContentImpl(sl<AddContentRepository>()));
  sl.registerFactory<AddContentRepository>(
          () => AddContentRepositoryImpl(sl<AddContentDataSource>()));
  sl.registerFactory<AddContentDataSource>(() => AddContentDataSourceImpl(sl()));
  sl.registerFactory(() => AddCubit(sl<AddContent>()));
  sl.registerFactory<ContentModel>(() => ContentModel());

}

disposeModule() {
  sl.get<ListCubit>().close();
  sl.unregister<ListCubit>();
}
