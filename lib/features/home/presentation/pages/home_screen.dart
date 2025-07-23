import 'package:flutter/material.dart';
import 'package:lms/core/theming/strings.dart';
import 'package:lms/core/theming/styles.dart';

import '../widgets/course_card.dart';
import '../widgets/lesson_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 15),
              Text(
                '${AppStrings.welcomeBack} Ethan!',
                style: AppStyles.textBold24(
                  context,
                ).copyWith(color: Colors.black87),
              ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: LessonCard(
                        title: 'Lesson ${index + 1}:\nIntroduction to\nPython',
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
              SizedBox(height: 30),
              Text(
                AppStrings.availableCourses,
                style: AppStyles.textSemiBold24(
                  context,
                ).copyWith(color: Colors.black87),
              ),
              SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return CourseCard(
                    image: "assets/images/1.png",
                    title: index % 2 == 0
                        ? 'Web Development\nBasics'
                        : 'Data Science\nFundamentals',
                  );
                },
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

