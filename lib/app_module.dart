import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:list/common/data/models/content_model.dart';
import 'package:list/features/content/list/data/data_source/content_data_source.dart';
import 'package:list/features/content/list/data/data_source/content_data_source_impl.dart';
import 'package:list/features/content/list/data/repositories/content_repository_impl.dart';
import 'package:list/features/content/list/domain/repositories/content_repository.dart';
import 'package:list/features/content/list/domain/use_cases/list_content.dart';
import 'package:list/features/content/list/presenter/content_cubit.dart';

final sl = GetIt.I;

startModule([Dio? dio]) {
  sl.registerFactory<ListContent>(
      () => ListContentImpl(sl<ContentRepository>()));
  sl.registerFactory<ContentRepository>(
      () => ContentRepositoryImpl(sl<ContentDataSource>()));
  sl.registerFactory<ContentDataSource>(() => ContentDataSourceImpl(sl()));
  sl.registerFactory(() => dio ?? Dio());
  sl.registerLazySingleton(() => ContentCubit(sl<ListContent>()));
  sl.registerFactory<List<ContentModel>>(() => <ContentModel>[]);
}

disposeModule() {
  sl.get<ContentCubit>().close();
  sl.unregister<ContentCubit>();
}
