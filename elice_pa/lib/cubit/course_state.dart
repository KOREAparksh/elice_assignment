part of 'course_cubit.dart';

@immutable
abstract class CourseState {
  const CourseState();
}

class CourseInitial extends CourseState {
  const CourseInitial();
}

class CourseLoading extends CourseState {
  const CourseLoading();
}

class CourseLoaded extends CourseState {
  Result result;
  final List<Course> courses = [];
  int courseCount;

  CourseLoaded(this.result, this.courseCount, List<Course> temp) {
    courses.addAll(temp);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseLoaded &&
          runtimeType == other.runtimeType &&
          result == other.result &&
          courses == other.courses &&
          courseCount == other.courseCount;

  @override
  int get hashCode => result.hashCode ^ courses.hashCode ^ courseCount.hashCode;
}

class CourseError extends CourseState {
  final String message;
  const CourseError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CourseError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
