import 'package:elice_pa/cubit/course_cubit.dart';
import 'package:dio/dio.dart';

class FreeCourseCubit extends CourseCubit {
  FreeCourseCubit(courseRepository) : super(courseRepository);

  @override
  Future<void> getCourse(
      {int offset = 0, int count = 10, bool isNew = false}) async {
    try {
      emit(const CourseLoading());
      if (isNew) {
        await Future.delayed(const Duration(milliseconds: 500));
      }
      final course = await courseRepository.fetchFreeCourse(offset, count);
      emit(CourseLoaded(course));
      print(state);
    } on DioError catch (e) {
      emit(CourseError(e.message));
    } catch (e) {
      emit(const CourseError("Other Error"));
    }
  }
}
