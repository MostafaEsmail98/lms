import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:lms/features/home/data/data_sources/home_data_sources.dart';

import '../../features/auth/data/data_sources/auth_data_source.dart';
import '../../features/auth/data/repositories/auth_repo.dart';
import '../../features/auth/domain/repositories/auth_repo_impl.dart';
import '../../features/auth/domain/use_cases/auth.dart';
import '../../features/auth/presentation/manager/auth_cubit.dart';
import '../../features/home/data/repositories/home_repo.dart';
import '../../features/home/domain/repositories/home_repo_impl.dart';
import '../../features/home/domain/use_cases/home_use_cases.dart';
import '../../features/home/presentation/manager/home_cubit.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  registerDataSources();
  registerRepositories();
  registerUseCases();
  registerCubits();
}

void registerDataSources() {
  sl.registerLazySingleton<FirebaseAuthDataSource>(
    () => FirebaseAuthDataSource(sl<FirebaseAuth>()),
  );
  sl.registerLazySingleton<HomeDataSources>(() => HomeDataSources(),);
}

void registerRepositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<FirebaseAuthDataSource>()),
  );
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl<HomeDataSources>()));
}

void registerUseCases() {
  sl.registerLazySingleton(() => AuthUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => HomeUseCases(sl<HomeRepo>()));
}

void registerCubits() {
  sl.registerLazySingleton(() => AuthCubit(sl<AuthUseCase>()));
  sl.registerLazySingleton(() => HomeCubit(sl<HomeUseCases>()));
  sl.registerLazySingleton(() => CoursesCubit(sl<HomeUseCases>()));
}
