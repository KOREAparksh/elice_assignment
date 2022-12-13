part of 'recommend_course_cubit.dart';

@immutable
abstract class RecommendCourseState {
  const RecommendCourseState();
}

class RecommendCourseInitial extends RecommendCourseState {
  const RecommendCourseInitial();
}

class RecommendCourseLoading extends RecommendCourseState {
  const RecommendCourseLoading();
}

class RecommendCourseLoaded extends RecommendCourseState {
  final CourseDto recommendCourses;
  const RecommendCourseLoaded(this.recommendCourses);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RecommendCourseLoaded && o.recommendCourses == recommendCourses;
  }

  @override
  int get hashCode => recommendCourses.hashCode;
}

class RecommendCourseError extends RecommendCourseState {
  final String message;
  const RecommendCourseError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RecommendCourseError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
