import 'package:json_annotation/json_annotation.dart';

part 'course_dto.g.dart';

@JsonSerializable()
class CourseDto {
  @JsonKey(name: "_result")
  Result result;
  List<Course> courses;

  CourseDto(this.result, this.courses);
  factory CourseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CourseDtoToJson(this);
}

@JsonSerializable()
class Result {
  String status;
  String reason;

  Result(this.status, this.reason);
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Course {
  String? logo_file_url;
  String? title;
  List<String> instructors;
  bool isDiscounted;

  Course(this.logo_file_url, this.title, this.instructors, this.isDiscounted);

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
