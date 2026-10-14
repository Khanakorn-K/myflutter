import 'package:get_it/get_it.dart';
import 'package:myflutter/features/home/data/datasource/home_datasource.dart';
import 'package:myflutter/features/home/data/repositories/home_repository.dart';
import 'package:myflutter/features/home/domain/repositories/home_repository.dart';
import 'package:myflutter/features/home/domain/usecase/home_usecase.dart';
import 'package:myflutter/features/home/presentation/view_model/home_viewmodel.dart';

final sl = GetIt.instance;

/// Composition root — ที่เดียวที่รู้จัก concrete class.
/// Presentation / Domain รู้จักแค่ abstract.
void homeSetupLocator() {
  // Data sources
  sl.registerLazySingleton<HomeDataSource>(() => HomeRemoteDataSource());

  // Repositories
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(dataSource: sl<HomeDataSource>()),
  );

  // Use cases
  sl.registerLazySingleton<HomeUseCase>(
    () => HomeUseCase(homeRepository: sl<HomeRepository>()),
  );

  // ViewModels
  sl.registerFactory<HomeViewModel>(
    () => HomeViewModel(homeUseCase: sl<HomeUseCase>()),
  );
}
