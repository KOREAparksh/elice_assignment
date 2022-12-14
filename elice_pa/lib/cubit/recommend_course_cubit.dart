import 'package:elice_pa/cubit/course_cubit.dart';
import 'package:dio/dio.dart';
import 'package:elice_pa/dto/course_dto.dart';

class RecommendCourseCubit extends CourseCubit {
  RecommendCourseCubit(courseRepository) : super(courseRepository);

  @override
  Future<void> getCourse(
      {int offset = 0, int count = 10, required List<Course> temp}) async {
    try {
      emit(const CourseLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      final courseDto =
          await courseRepository.fetchRecommendCourse(offset, count);
      if (courseDto.result.status != "ok") {
        throw Exception("api result not ok");
      }
      temp.addAll(courseDto.courses ?? []);
      emit(CourseLoaded(courseDto.result, courseDto.courseCount ?? 0, temp));
    } on DioError catch (e) {
      emit(CourseError(e.message));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }
}
