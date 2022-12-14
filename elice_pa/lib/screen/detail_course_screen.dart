import 'package:elice_pa/config/color.dart';
import 'package:elice_pa/cubit/course_cubit.dart';
import 'package:elice_pa/cubit/free_course_cubit.dart';
import 'package:elice_pa/cubit/recommend_course_cubit.dart';
import 'package:elice_pa/dto/course_dto.dart';
import 'package:elice_pa/util/converter.dart';
import 'package:elice_pa/widget/course_tile/detail_course_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum CourseType { RECOMMEND, FREE }

class DetailCourseScreen extends StatefulWidget {
  const DetailCourseScreen({
    Key? key,
    required this.initCourses,
    required this.courseType,
  }) : super(key: key);
  final courseType;
  final List<Course> initCourses;
  final _title = "무료 과목";

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  //Controller
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  //Data
  // late final recommendCubit = context.read<RecommendCourseCubit>();
  // late final freeCubit = context.read<FreeCourseCubit>();
  late final CourseCubit cubit;
  final List<Course> courses = [];

  //MarginPadding
  final _listViewSidePadding = 12.0;
  final _listViewBottomPadding = 10.0;

  @override
  void initState() {
    super.initState();
    switch (widget.courseType) {
      case CourseType.RECOMMEND:
        cubit = context.read<RecommendCourseCubit>() as CourseCubit;
        break;
      case CourseType.FREE:
        cubit = context.read<FreeCourseCubit>() as CourseCubit;
        break;
      default:
        cubit = context.read<RecommendCourseCubit>() as CourseCubit;
    }
    courses.clear();
    courses.addAll(widget.initCourses);
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: _appBar(),
      body: _blocBuilder(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: appBarMainColor,
      centerTitle: true,
      title: Text(
        widget._title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _blocBuilder() {
    switch (widget.courseType) {
      case CourseType.RECOMMEND:
        return BlocBuilder<RecommendCourseCubit, CourseState>(
          builder: (context, state) {
            if (state is CourseLoaded) {
              courses.addAll(state.courses.courses);
            } else if (state is CourseLoading) {}
            return _listView();
          },
        );

      case CourseType.FREE:
        return BlocBuilder<FreeCourseCubit, CourseState>(
          builder: (context, state) {
            if (state is CourseLoaded) {
              courses.addAll(state.courses.courses);
            } else if (state is CourseLoading) {}
            return _listView();
          },
        );

      default:
        return const Center(child: Text("type error"));
    }
  }

  Widget _listView() {
    return Padding(
      padding: EdgeInsets.only(
        left: _listViewSidePadding,
        right: _listViewSidePadding,
        top: _listViewBottomPadding,
      ),
      child: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: _itemBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(_, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: _listViewBottomPadding),
      child: DetailCourseTile(
        title: titleConverter(courses[index].title),
        instructor: instructorConverter(courses[index].instructors),
        url: courses[index].logoFileUrl,
      ),
    );
  }

  void _onRefresh() async {
    switch (widget.courseType) {
      case CourseType.RECOMMEND:
        cubit.getCourse();
        break;
      case CourseType.FREE:
        cubit.getCourse();
        break;
    }
    courses.clear();
    _refreshController.refreshCompleted();
  }
}
