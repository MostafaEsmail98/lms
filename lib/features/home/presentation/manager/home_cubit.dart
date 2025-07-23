import 'package:bloc/bloc.dart';
import 'package:lms/features/home/domain/use_cases/home_use_cases.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/models/courses_model.dart';
import '../../domain/entities/user_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeUseCases) : super(HomeInitial());

  final HomeUseCases homeUseCases;

  Future<void> getUserData() async {
    emit(HomeLoading());
    SharedPrefHelper.getSecuredString("token")
        .then((token) async {
          if (token.isNotEmpty) {
            final result = await homeUseCases.fetchUserData(token);
            result.fold(
              (failure) => emit(HomeError(failure.message)),
              (user) => emit(HomeSuccess(user)),
            );
          } else {
            emit(HomeError("Token is empty"));
          }
        })
        .catchError((error) {
          emit(HomeError("Failed to retrieve token: $error"));
        });
  }
}

class CoursesCubit extends Cubit<HomeState> {
  CoursesCubit(this.homeUseCases) : super(HomeInitial());

  final HomeUseCases homeUseCases;

  Future<void> getAllCourses() async {
    emit(HomeCoursesLoading());
    final result = await homeUseCases.getAllCourses();
    result.fold(
      (failure) => emit(HomeCoursesError(failure.message)),
      (courses) => emit(HomeCoursesSuccess(courses)),
    );
  }
}
