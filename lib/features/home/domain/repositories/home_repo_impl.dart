import 'package:dartz/dartz.dart';
import 'package:lms/features/home/data/repositories/home_repo.dart';

import '../../../../core/error/failures.dart';
import '../../data/data_sources/home_data_sources.dart';
import '../../data/models/courses_model.dart';
import '../entities/user_entity.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeDataSources homeDataSources;

  HomeRepoImpl(this.homeDataSources);

  @override
  Future<Either<Failure, UserEntity>> fetchUserData(String token) async{
    return await homeDataSources.fetchUserData(token);
  }
  @override
  Future<Either<Failure, List<CourseModel>>> getAllCourses() async {
    return await homeDataSources.getAllCourses();
  }
}
