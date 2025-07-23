import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../models/courses_model.dart';

abstract class HomeRepo {
  Future <Either<Failure, UserEntity>> fetchUserData(String token);
  Future<Either<Failure, List<CourseModel>>> getAllCourses();
}