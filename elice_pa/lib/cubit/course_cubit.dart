import 'package:elice_pa/dto/course_dto.dart';
import 'package:elice_pa/repository/course_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'course_state.dart';

abstract class CourseCubit extends Cubit<CourseState> {
  final CourseRepository courseRepository;

  CourseCubit(this.courseRepository) : super(CourseInitial());
  Future<void> getCourse({int offset = 0, int count = 10});
}
