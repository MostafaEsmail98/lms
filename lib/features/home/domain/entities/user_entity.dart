class UserEntity {
  final String uid;
  final String email;
  final String? name;
  final List<LessonModel>? lessons;

  UserEntity({required this.uid, required this.email, this.name,required this.lessons, });

  toJson() {
    return {'uid': uid, 'email': email, 'name': name , 'lessons': lessons?.map((e) => e.toMap()).toList()};
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      lessons: (json['lessons'] as List<dynamic>?)
          ?.map((e) => LessonModel.fromMap(e as Map<String, dynamic>))
          .toList() ?? [],
    );
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
