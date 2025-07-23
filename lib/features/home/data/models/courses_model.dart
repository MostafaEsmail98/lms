import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  final String id;
  final String title;
  final String description;
  final String image;
  final DateTime createdAt;
  final List<LessonModel> lessons;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.lessons,
  });

  factory CourseModel.fromDoc(String id, Map<String, dynamic> map) {
    return CourseModel(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      lessons: (map['lessons'] as List<dynamic>)
          .map((e) => LessonModel.fromMap(e))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'createdAt': Timestamp.fromDate(createdAt),
      'lessons': lessons.map((e) => e.toMap()).toList(),
    };
  }
}
class LessonModel {
  final String lessonId;
  final String title;
  final String videoUrl;
  final String duration;

  LessonModel({
    required this.lessonId,
    required this.title,
    required this.videoUrl,
    required this.duration,
  });

  factory LessonModel.fromMap(Map<String, dynamic> map) {
    return LessonModel(
      lessonId: map['lessonId'] ?? '',
      title: map['title'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      duration: map['duration'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lessonId': lessonId,
      'title': title,
      'videoUrl': videoUrl,
      'duration': duration,
    };
  }
}
