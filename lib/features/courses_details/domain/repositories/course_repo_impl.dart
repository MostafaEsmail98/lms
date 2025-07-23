import 'package:dartz/dartz.dart';
import 'package:lms/features/courses_details/data/repositories/course_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/model/enroll_course.dart';
import '../../data/data_sources/course_details.dart';

class CourseRepoImpl extends CourseRepository {
  final CourseDetails courseDetails;

  CourseRepoImpl(this.courseDetails);



  @override
  Future<Either<Failure, void>> enrollInCourse(String courseId) {
    return courseDetails.enrollInCourse(courseId);
  }

  @override
  Future<Either<Failure, EnrollCourseModel>>fetchCourseDetails() {
    return courseDetails.fetchCourseDetails();
  }
}
