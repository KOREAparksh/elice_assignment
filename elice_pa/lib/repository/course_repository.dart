import 'package:elice_pa/dto/course_dto.dart';
import 'package:elice_pa/service/api/course_api.dart';
import 'package:elice_pa/service/custom_dio.dart';

class CourseRepository {
  Future<CourseDto> fetchRecommendCourse(int offset, int count) async {
    CustomDio customDio = CustomDio();
    CourseApi courseApi = CourseApi(customDio.dio);

    final result =
        await courseApi.getRecommendCourses(offset: offset, count: count);
    //Todo : statusCode에 따른 처리
    customDio.dio.close();
    return result;
  }

  Future<CourseDto> fetchFreeCourse(int offset, int count) async {
    CustomDio customDio = CustomDio();
    CourseApi courseApi = CourseApi(customDio.dio);

    final result = await courseApi.getFreeCourses(offset: offset, count: count);
    //Todo : statusCode에 따른 처리
    customDio.dio.close();
    return result;
  }
}
