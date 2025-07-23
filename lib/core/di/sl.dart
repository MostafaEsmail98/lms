import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/data_sources/auth_data_source.dart';
import '../../features/auth/data/repositories/auth_repo.dart';
import '../../features/auth/domain/repositories/auth_repo_impl.dart';
import '../../features/auth/domain/use_cases/auth.dart';
import '../../features/auth/presentation/manager/auth_cubit.dart';

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
}

void registerRepositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<FirebaseAuthDataSource>()),
  );
}

void registerUseCases() {
  sl.registerLazySingleton(() => AuthUseCase(sl<AuthRepository>()));
}

void registerCubits() {
  sl.registerLazySingleton(() => AuthCubit(sl<AuthUseCase>()));
}
