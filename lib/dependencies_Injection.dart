import 'package:get_it/get_it.dart';
import 'package:myflutter/features/home/data/datasource/home_datasource.dart';
import 'package:myflutter/features/home/data/repositories/home_repository.dart';
import 'package:myflutter/features/home/domain/repositories/home_repository.dart';
import 'package:myflutter/features/home/domain/usecase/home_usecase.dart';
import 'package:myflutter/features/home/presentation/viewModel/home_viewmodel.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton(() => HomeDataSource());
  sl.registerLazySingleton<IHomeRepository>(() => HomeRepository(dataSource: sl()));
  sl.registerLazySingleton(() => HomeUseCase(homeRepository: sl()));
  sl.registerFactory(() => HomeViewModel(homeUseCase: sl()));
}