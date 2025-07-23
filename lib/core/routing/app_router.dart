import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/features/auth/presentation/pages/sign_in/sign_in.dart';
import 'package:lms/features/auth/presentation/pages/sign_up/sign_up.dart';
import 'package:lms/features/home_layout/presentation/manager/home_layout_cubit.dart';
import 'package:lms/features/home_layout/presentation/pages/home_layout_screen.dart';


class AppRoutes {
  static const String homeLayout = '/homeLayout';
  static const String signIn = '/';
  static const String signUp = '/signUp';

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
    ],
  );
}
