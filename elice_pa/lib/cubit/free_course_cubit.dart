import 'package:bloc/bloc.dart';
import 'package:elice_pa/dto/course_dto.dart';
import 'package:elice_pa/repository/course_repository.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'free_course_state.dart';

class FreeCourseCubit extends Cubit<FreeCourseState> {
  final CourseRepository courseRepository;

  FreeCourseCubit(this.courseRepository) : super(FreeCourseInitial());

  Future<void> getFreeCourse({int offset = 0, int count = 10}) async {
    try {
      emit(FreeCourseLoading());
      final course = await courseRepository.fetchFreeCourse(offset, count);
      emit(FreeCourseLoaded(course));
    } on DioError catch (e) {
      emit(FreeCourseError(e.message));
    } catch (e) {
      emit(FreeCourseError("Other Error"));
    }
  }
}
