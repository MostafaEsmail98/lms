import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/repositories/auth_repo.dart';
import '../entities/user_entity.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  Future<Either<Failure, UserEntity>> callSignIn(
    String email,
    String password,
  ) {
    return repository.signIn(email, password);
  }

  Future<Either<Failure, UserEntity>> callSignUp(
    String email,
    String password,
    String name,
  ) {
    return repository.signUp(email, password, name);
  }
}
