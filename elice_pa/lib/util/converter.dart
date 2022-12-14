import 'package:elice_pa/dto/course_dto.dart';

String instructorConverter(List<Instructor> instructors) {
  if (instructors.isEmpty || instructors.first.fullname == null) {
    return "선생님 미등록";
  }
  return "${instructors.first.fullname} 선생님";
}

String titleConverter(String? title) {
  if (title == null) {
    return "타이틀 미등록";
  }
  return "${title}\n";
}
