import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/features/home_layout/presentation/manager/home_layout_cubit.dart';
import 'package:lms/features/home_layout/presentation/pages/home_layout_screen.dart';

import '../../features/home/presentation/pages/home_screen.dart';

class AppRoutes {
  static const String homeLayout = '/';


  static final router = GoRouter(routes: [
    GoRoute(path: homeLayout,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => HomeLayoutCubit(),
          child: HomeLayoutScreen(),
        );
      },
    ),
  ]);
}

