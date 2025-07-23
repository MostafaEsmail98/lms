part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final UserEntity user;

  HomeSuccess(this.user);
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

final class HomeCoursesLoading extends HomeState {}

final class HomeCoursesError extends HomeState {
  final String message;

  HomeCoursesError(this.message);
}

final class HomeCoursesSuccess extends HomeState {
  final List<CourseModel> courses;

  HomeCoursesSuccess(this.courses);
}
