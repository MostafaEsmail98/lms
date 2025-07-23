import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/model/enroll_course.dart';

abstract class CourseRepository {
  Future<Either<Failure, EnrollCourseModel>> fetchCourseDetails();

  Future<Either<Failure, void>> enrollInCourse(String courseId);

}
