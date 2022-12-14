import 'package:elice_pa/dto/course_dto.dart';
import 'package:flutter/material.dart';

class DetailCourseScreen extends StatelessWidget {
  const DetailCourseScreen({
    Key? key,
    required this.courses,
  }) : super(key: key);
  final List<Course> courses;
  final _title = "무료 과목";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
    );
  }
}
