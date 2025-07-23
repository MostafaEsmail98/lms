import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routing/app_router.dart';
import 'package:lms/core/theming/strings.dart';
import 'package:lms/core/theming/styles.dart';
import 'package:lms/features/home/presentation/manager/home_cubit.dart';

import '../../../../core/di/sl.dart';
import '../widgets/course_card.dart';
import '../widgets/lesson_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HomeCubit>()..getUserData()),
        BlocProvider(create: (context) => sl<CoursesCubit>()..getAllCourses()),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          } else if (state is HomeSuccess) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(height: 15),
                      Text(
                        '${AppStrings.welcomeBack} ${state.user.name}!',
                        style: AppStyles.textBold24(
                          context,
                        ).copyWith(color: Colors.black87),
                      ),
                      if (state.user.lessons!.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            Text(
                              AppStrings.recentLessons,
                              style: AppStyles.textSemiBold24(
                                context,
                              ).copyWith(color: Colors.black87),
                            ),
                            SizedBox(height: 15),
                            SizedBox(
                              height: 90,
                              width: double.infinity,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0,
                                    ),
                                    child: LessonCard(
                                      title:
                                          'Lesson ${index + 1}:\nIntroduction to\nPython',
                                      backgroundColor: index % 2 == 0
                                          ? Colors.orange[100]!
                                          : Colors.blue[100]!,
                                      iconColor: index % 2 == 0
                                          ? Colors.orange[700]!
                                          : Colors.blue[700]!,
                                    ),
                                  );
                                },
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ],
                        ),

                      SizedBox(height: 30),
                      Text(
                        AppStrings.availableCourses,
                        style: AppStyles.textSemiBold24(
                          context,
                        ).copyWith(color: Colors.black87),
                      ),
                      SizedBox(height: 15),
                      BlocBuilder<CoursesCubit, HomeState>(
                        builder: (context, state) {
                          if (state is HomeCoursesLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is HomeCoursesError) {
                            return Center(child: Text(state.message));
                          } else if (state is HomeCoursesSuccess) {
                            return GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.courses.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                  ),
                              itemBuilder: (context, index) {
                                final course = state.courses[index];
                                return InkWell(
                                  onTap: () {
                                    context.push(
                                      AppRoutes.courseDetails,
                                      extra: course,
                                    );
                                  },
                                  child: CourseCard(
                                    image: course.image,
                                    title: course.title,
                                  ),
                                );
                              },
                            );
                          }
                          return Center(child: Text('No courses available'));
                        },
                      ),
                    ]),
                  ),
                ),
              ],
            );
          }
          return Center(child: Text('Unexpected state'));
        },
      ),
    );
  }
}
