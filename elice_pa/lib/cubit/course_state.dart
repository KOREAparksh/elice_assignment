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
  final CourseDto courses;
  const CourseLoaded(this.courses);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CourseLoaded && o.courses == courses;
  }

  @override
  int get hashCode => courses.hashCode;
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
