import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/features/auth/presentation/pages/sign_in/sign_in.dart';
import 'package:lms/features/auth/presentation/pages/sign_up/sign_up.dart';
import 'package:lms/features/home/data/models/courses_model.dart';
import 'package:lms/features/home_layout/presentation/manager/home_layout_cubit.dart';
import 'package:lms/features/home_layout/presentation/pages/home_layout_screen.dart';

import '../../features/courses_details/presentation/pages/course_details.dart';
import '../../features/courses_details/presentation/pages/lesson_screen.dart';
import '../../features/splash/splash_screen.dart';

class AppRoutes {
  static const String homeLayout = '/homeLayout';
  static const String signIn = '/signIn';
  static const String splashScreen = '/';
  static const String signUp = '/signUp';
  static const String courseDetails = '/courseDetails';
  static const String lessonScreen = '/LessonScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: homeLayout,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => HomeLayoutCubit(),
            child: HomeLayoutScreen(),
          );
        },
      ),
      GoRoute(
        path: signIn,
        builder: (context, state) {
          return SignIn();
        },
      ),
      GoRoute(
        path: signUp,
        builder: (context, state) {
          return SignUp();
        },
      ),
      GoRoute(
        path: splashScreen,
        builder: (context, state) {
          return SplashScreen();
        },
      ),     GoRoute(
        path: lessonScreen,
        builder: (context, state) {
          final link = state.extra as String;
          return LessonScreen(url: link,);
        },
      ),
      GoRoute(
        path: courseDetails,
        builder: (context, state) {
          final course = state.extra as CourseModel;

          return CourseDetails(courseModel: course);
        },
      ),
    ],
  );
}
