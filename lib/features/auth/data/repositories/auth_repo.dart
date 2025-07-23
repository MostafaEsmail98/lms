import 'package:dartz/dartz.dart';
import '../../domain/entities/user_entity.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signUp(String email, String password , String name);
  Future<Either<Failure, UserEntity>> signIn(String email, String password);
}
