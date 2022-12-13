part of 'free_course_cubit.dart';

@immutable
abstract class FreeCourseState {
  const FreeCourseState();
}

class FreeCourseInitial extends FreeCourseState {
  const FreeCourseInitial();
}

class FreeCourseLoading extends FreeCourseState {
  const FreeCourseLoading();
}

class FreeCourseLoaded extends FreeCourseState {
  final CourseDto freeCourses;
  const FreeCourseLoaded(this.freeCourses);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FreeCourseLoaded && o.freeCourses == freeCourses;
  }

  @override
  int get hashCode => freeCourses.hashCode;
}

class FreeCourseError extends FreeCourseState {
  final String message;
  const FreeCourseError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FreeCourseError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
