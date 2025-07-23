import 'package:flutter/material.dart';
import 'package:lms/core/theming/styles.dart';

class CourseCard extends StatelessWidget {
  final String image;
  final String title;

  const CourseCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 120,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: AppStyles.textSemiBold20(context).copyWith(
            color: Colors.black,
            height: 1.2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
