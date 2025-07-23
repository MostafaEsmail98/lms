import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/model/enroll_course.dart';
import '../../data/repositories/course_repo.dart';

class CourseUseCase {
  final CourseRepository courseRepository;

  CourseUseCase(this.courseRepository);

  Future<Either<Failure, EnrollCourseModel>> fetchCourseDetails() {
    return courseRepository.fetchCourseDetails();
  }

  Future<Either<Failure, void>> enrollInCourse(String courseId) {
    return courseRepository.enrollInCourse(courseId);
  }
}
