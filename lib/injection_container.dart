import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:images_project/core/network/dio_settings.dart';
import 'package:images_project/core/util/app_config.dart';
import 'package:images_project/features/image_pages/data/datasources/remote_image_page_data_source.dart';
import 'package:images_project/features/image_pages/data/mapper/image_entity_mapper.dart';
import 'package:images_project/features/image_pages/data/repositories/image_page_repository.dart';
import 'package:images_project/features/image_pages/domain/repositories/image_page_repository.dart';
import 'package:images_project/features/image_pages/domain/usecases/get_image_page.dart';

import 'features/image_pages/presentation/bloc/get_image_page_bloc.dart';

final sl = GetIt.instance;

void init() {
  // External
  sl.registerLazySingleton<Dio>(() => Dio());
  
  // Core
  sl.registerLazySingleton<ImageEntityMapper>(() => ImageEntityMapper());
  sl.registerLazySingleton<AppConfig>(() => AppConfigImpl());
  sl.registerLazySingleton<DioSettings>(() => DioSettings(appConfig: sl.get<AppConfig>()));
  // DataSources
  sl.registerLazySingleton<RemoteImagePageDataSource>(
    () => RemoteImagePageDataSourceImpl(
      client: sl.get<Dio>(),
      imageEntityMapper: sl.get<ImageEntityMapper>(),
      dioSettings: sl.get<DioSettings>(),
    ),
  );
  // Repository
  sl.registerLazySingleton<ImagePageRepository>(
      () => ImagePageRepositoryImpl(
            dataSource: sl.get<RemoteImagePageDataSource>(),
          ));
  // UseCase
  sl.registerLazySingleton<GetImagePage>(
      () => GetImagePage(imagePageRepository: sl.get<ImagePageRepository>()));
  // BLoC
  sl.registerFactory(() => GetImagePageBloc(getImagePage: sl.get<GetImagePage>()));  
}
