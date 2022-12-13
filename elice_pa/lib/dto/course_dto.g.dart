// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDto _$CourseDtoFromJson(Map<String, dynamic> json) => CourseDto(
      Result.fromJson(json['_result'] as Map<String, dynamic>),
      (json['courses'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseDtoToJson(CourseDto instance) => <String, dynamic>{
      '_result': instance.result,
      'courses': instance.courses,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      json['status'] as String,
      json['reason'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'status': instance.status,
      'reason': instance.reason,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      json['logo_file_url'] as String?,
      json['title'] as String?,
      (json['instructors'] as List<dynamic>).map((e) => e as String).toList(),
      json['is_discounted'] as bool,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'logo_file_url': instance.logo_file_url,
      'title': instance.title,
      'instructors': instance.instructors,
      'is_discounted': instance.isDiscounted,
    };
