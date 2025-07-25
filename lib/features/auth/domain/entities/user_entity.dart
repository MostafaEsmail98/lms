class UserEntity {
  final String uid;
  final String email;
  final List<LessonModel>? lessons;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.lessons,
  });
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
