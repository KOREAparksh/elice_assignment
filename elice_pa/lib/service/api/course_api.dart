import 'package:elice_pa/dto/course_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'course_api.g.dart';

@RestApi()
abstract class CourseApi {
  factory CourseApi(Dio dio) = _CourseApi;

  @GET("course/list/")
  Future<CourseDto> getAllList({
    @Query('offset') int offset = 0,
    @Query('count') int count = 10,
  });

  @GET("course/list/")
  Future<CourseDto> getRecommendCourses({
    @Query('filter_is_free') bool free = false,
    @Query('filter_is_recommended') bool recommended = true,
    @Query('offset') int offset = 0,
    @Query('count') int count = 10,
  });

  @GET("course/list/")
  Future<CourseDto> getFreeCourses({
    @Query('filter_is_free') bool free = true,
    @Query('filter_is_recommended') bool recommended = false,
    @Query('offset') int offset = 0,
    @Query('count') int count = 10,
  });
}
