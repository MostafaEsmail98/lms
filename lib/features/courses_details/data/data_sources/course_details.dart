import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:lms/core/error/failures.dart';
import 'package:lms/core/helpers/shared_pref_helper.dart';
import 'package:lms/core/model/enroll_course.dart';
import 'package:lms/core/networking/firebase.dart';

class CourseDetails {
  Future<Either<Failure, EnrollCourseModel>> fetchCourseDetails() async {
    try {
      final token = await SharedPrefHelper.getSecuredString("token");
      final courseDetails = await FirebaseHelper.returnUserCollectionRef()
          .doc(token)
          .get();
      if (courseDetails.exists) {
        final data = courseDetails.data();
        if (data != null) {
          return Right(EnrollCourseModel.fromMap(data as Map<String, dynamic>));
        } else {
          return Left(ServerFailure("No data found"));
        }
      } else {
        return Left(ServerFailure("Course not found"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> enrollInCourse(String courseId) async {
    try {
      final token = await SharedPrefHelper.getSecuredString("token");
      final userRef = FirebaseHelper.returnUserCollectionRef().doc(token);

      // Update user's enrolled courses
      await userRef.update({
        'enrolledCourses': FieldValue.arrayUnion([courseId]),
      });

      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}
