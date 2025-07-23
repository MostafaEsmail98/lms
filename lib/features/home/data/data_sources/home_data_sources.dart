import 'package:dartz/dartz.dart';
import 'package:lms/core/error/failures.dart';
import 'package:lms/features/home/data/models/courses_model.dart';
import 'package:lms/features/home/domain/entities/user_entity.dart';

import '../../../../core/networking/firebase.dart';

class HomeDataSources {
  Future<Either<Failure, UserEntity>> fetchUserData(String token) async {
    try {
      final userData = await FirebaseHelper.returnUserCollectionRef()
          .doc(token)
          .get();
      if (userData.exists) {
        final data = userData.data()!;
        return Right(UserEntity.fromJson(data as Map<String, dynamic>));
      } else {
        return Left(ServerFailure("User not found"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<CourseModel>>> getAllCourses() async {
    try {
      return FirebaseHelper.returnCoursesCollectionRef().get().then((snapshot) {
        if (snapshot.docs.isEmpty) {
          return Left(ServerFailure("No courses found"));
        } else {
          final courses = snapshot.docs
              .map(
                (doc) => CourseModel.fromDoc(
                  doc.data() as Map<String, dynamic>,
                ),
              )
              .toList();
          return Right(courses);
        }
      });
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
