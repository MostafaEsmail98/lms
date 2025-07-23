import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/data_sources/auth_data_source.dart';
import '../../data/repositories/auth_repo.dart';
import '../../domain/entities/user_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, UserEntity>> signIn(
    String email,
    String password,
  ) async {

return await dataSource.signIn(email, password);


  }

  @override
  Future<Either<Failure, UserEntity>> signUp(
    String email,
    String password,
    String name,
  ) async {
    return await dataSource.signUp(email, password, name);
  }
}
