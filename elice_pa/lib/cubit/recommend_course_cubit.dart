import 'package:elice_pa/cubit/course_cubit.dart';
import 'package:dio/dio.dart';

class RecommendCourseCubit extends CourseCubit {
  RecommendCourseCubit(courseRepository) : super(courseRepository);

  @override
  Future<void> getCourse({int offset = 0, int count = 10}) async {
    try {
      emit(CourseInitial());
      final course = await courseRepository.fetchRecommendCourse(offset, count);
      emit(CourseLoaded(course));
    } on DioError catch (e) {
      emit(CourseError(e.message));
    } catch (e) {
      print(e);
      emit(CourseError("Other Error"));
    }
  }
}
