import 'package:bloc/bloc.dart';
import 'package:elice_pa/dto/course_dto.dart';
import 'package:elice_pa/repository/course_repository.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'recommend_course_state.dart';

class RecommendCourseCubit extends Cubit<RecommendCourseState> {
  final CourseRepository courseRepository;

  RecommendCourseCubit(this.courseRepository) : super(RecommendCourseInitial());

  Future<void> getRecommendCourse({int offset = 0, int count = 10}) async {
    try {
      emit(RecommendCourseLoading());
      final course = await courseRepository.fetchRecommendCourse(offset, count);
      emit(RecommendCourseLoaded(course));
    } on DioError catch (e) {
      emit(RecommendCourseError(e.message));
    } catch (e) {
      print(e);
      emit(RecommendCourseError("Other Error"));
    }
  }
}
