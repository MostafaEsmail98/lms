import 'package:bloc/bloc.dart';
import 'package:lms/features/courses_details/domain/use_cases/course_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../core/model/enroll_course.dart';
import '../../../home/data/models/courses_model.dart';

part 'course_details_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit(this.courseUseCase) : super(CourseDetailsInitial());

  final CourseUseCase courseUseCase;
  late CourseModel courseModel;

  void setCourseModel(CourseModel model) {
    courseModel = model;
  }

  Future<void> fetchCourseDetails() async {
    emit(CourseDetailsLoading());
    final res = await courseUseCase.fetchCourseDetails();
    res.fold((failure) {
      emit(CourseDetailsError(failure.message));
    }, (courseDetails) => emit(CourseDetailsLoaded(courseDetails)));
  }

  Future<void> enrollInCourse(String courseId) async {
    try {
      emit(CourseEnrollmentLoading());
      await courseUseCase.enrollInCourse(courseId);
      emit(CourseEnrollmentSuccess());
    } catch (e) {
      emit(CourseEnrollmentError(e.toString()));
    }
  }
}
