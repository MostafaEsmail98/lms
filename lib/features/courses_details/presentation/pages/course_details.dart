import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/routing/app_router.dart';
import 'package:lms/core/theming/strings.dart';
import 'package:lms/core/theming/styles.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/features/courses_details/presentation/manager/course_details_cubit.dart';
import 'package:lms/features/courses_details/presentation/widgets/lesson_item.dart';
import 'package:lms/features/home/data/models/courses_model.dart';

import '../../../../core/di/sl.dart';
import '../../../../core/model/enroll_course.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  void initState() {
    sl<CourseDetailsCubit>().setCourseModel(widget.courseModel);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CourseDetailsCubit>()..fetchCourseDetails(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.pop(),
          ),
          title: Text(
            AppStrings.courseDetails,
            style: AppStyles.textMedium20(
              context,
            ).copyWith(color: Colors.black87),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Image
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      sl<CourseDetailsCubit>().courseModel.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      sl<CourseDetailsCubit>().courseModel.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Description
                    Text(
                      sl<CourseDetailsCubit>().courseModel.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 30),

                    BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
                      builder: (context, state) {
                        if (state is CourseDetailsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is CourseDetailsError) {
                          return Center(
                            child: Text(
                              'Error: ${state.message}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        } else if (state is CourseDetailsLoaded) {
                          final isEnrolled =
                              state.courseDetails.enrolledCourses?.contains(
                                sl<CourseDetailsCubit>().courseModel.id,
                              ) ??
                              false;

                          if (isEnrolled) {
                            return ListView.builder(
                              itemCount: sl<CourseDetailsCubit>()
                                  .courseModel
                                  .lessons
                                  .length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final lesson = sl<CourseDetailsCubit>()
                                    .courseModel
                                    .lessons[index];
                                final isLessonCompleted =
                                    state.courseDetails.recentLessons?.contains(
                                      RecentLesson(
                                        lessonId: lesson.lessonId,
                                        courseId: sl<CourseDetailsCubit>()
                                            .courseModel
                                            .id,
                                      ),
                                    ) ??
                                    false;

                                return InkWell(
                                  onTap: () async {
                                    context.push(AppRoutes.lessonScreen,
                                      extra: lesson.videoUrl,
                                    );
                                  },
                                  child: LessonItem(
                                    lessonNumber: '${index + 1}',
                                    title: lesson.title,
                                    isCompleted: true,
                                  ),
                                );
                              },
                            );
                          } else {
                            return AppTextButton(
                              buttonText: "Enroll",
                              textStyle: AppStyles.textSemiBold18(context),
                              onPressed: () {
                                context
                                    .read<CourseDetailsCubit>()
                                    .enrollInCourse(
                                      sl<CourseDetailsCubit>().courseModel.id,
                                    );
                              },
                            );
                          }
                        }

                        return const Center(
                          child: Text(
                            'No lessons available',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
