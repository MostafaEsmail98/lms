class RecentLesson {
  final String? lessonId;
  final String? courseId;

  RecentLesson({required this.lessonId, required this.courseId});

  factory RecentLesson.fromMap(Map<String, dynamic> map) {
    return RecentLesson(lessonId: map['lessonId'] ?? "", courseId: map['courseId'] ?? "");
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RecentLesson &&
        other.lessonId == lessonId &&
        other.courseId == courseId;
  }

  @override
  int get hashCode => lessonId.hashCode ^ courseId.hashCode;

  Map<String, dynamic> toMap() {
    return {'lessonId': lessonId, 'courseId': courseId};
  }
}

class EnrollCourseModel {
  final List<String>? enrolledCourses;
  final List<RecentLesson>? recentLessons;

  EnrollCourseModel({
    required this.enrolledCourses,
    required this.recentLessons,
  });

  factory EnrollCourseModel.fromMap(Map<String, dynamic> map) {
    return EnrollCourseModel(
      enrolledCourses: List<String>.from(map['enrolledCourses'] ?? []),
      recentLessons: (map['recentLessons'] as List<dynamic>? ?? [])
          .map((e) => RecentLesson.fromMap(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'enrolledCourses': enrolledCourses,
      'recentLessons': recentLessons?.map((e) => e.toMap()).toList() ?? [],
    };
  }
}
