part of 'course_details_cubit.dart';

@immutable
sealed class CourseDetailsState {}

final class CourseDetailsInitial extends CourseDetailsState {}

final class CourseDetailsLoading extends CourseDetailsState {}

final class CourseDetailsLoaded extends CourseDetailsState {
  final EnrollCourseModel courseDetails;

  CourseDetailsLoaded(this.courseDetails);
}

final class CourseDetailsError extends CourseDetailsState {
  final String message;

  CourseDetailsError(this.message);
}

final class CourseEnrollmentLoading extends CourseDetailsState {}

final class CourseEnrollmentSuccess extends CourseDetailsState {}

final class CourseEnrollmentError extends CourseDetailsState {
  final String message;

  CourseEnrollmentError(this.message);
}

final class RecentLessonLoading extends CourseDetailsState {}

final class RecentLessonSuccess extends CourseDetailsState {}

final class RecentLessonError extends CourseDetailsState {
  final String message;

  RecentLessonError(this.message);
}
