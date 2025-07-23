import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/courses_model.dart';
import '../../data/repositories/home_repo.dart';
import '../entities/user_entity.dart';

class HomeUseCases {
  final HomeRepo homeRepo;
  HomeUseCases(this.homeRepo);

  Future<Either<Failure, UserEntity>> fetchUserData(String token) async {
    return await homeRepo.fetchUserData(token);
  }
  Future<Either<Failure, List<CourseModel>>> getAllCourses() async {
    return await homeRepo.getAllCourses();
  }
}