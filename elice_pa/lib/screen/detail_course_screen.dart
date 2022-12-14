import 'package:elice_pa/config/color.dart';
import 'package:elice_pa/cubit/free_course_cubit.dart';
import 'package:elice_pa/cubit/recommend_course_cubit.dart';
import 'package:elice_pa/dto/course_dto.dart';
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
  //String
  final _defaultTitle = "제목 미정";
  final _defaultInstructor = "선생님 미등록";

  //Controller
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  //Data
  late final recommendCubit = context.read<RecommendCourseCubit>();
  late final freeCubit = context.read<FreeCourseCubit>();
  final List<Course> courses = [];

  //MarginPadding
  final _listViewSidePadding = 12.0;
  final _listViewBottomPadding = 10.0;

  @override
  void initState() {
    super.initState();
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
      body: BlocBuilder<RecommendCourseCubit, RecommendCourseState>(
        builder: _blocBuilder,
      ),
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

  Widget _blocBuilder(context, state) {
    if (state is RecommendCourseLoaded) {
      courses.clear();
      courses.addAll(state.recommendCourses.courses);
    }
    return _listView();
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
    final String title = courses[index].title ?? _defaultTitle;
    return Container(
      margin: EdgeInsets.only(bottom: _listViewBottomPadding),
      child: DetailCourseTile(
        title: ("$title\n"),
        url: courses[index].logoFileUrl ?? "",
        instructor: (courses[index].instructors.isEmpty)
            ? _defaultInstructor
            : "${courses[index].instructors.first.fullname} 선생님",
      ),
    );
  }

  void _onRefresh() {
    recommendCubit.getRecommendCourse();
    _refreshController.refreshCompleted();
  }
}

class DetailCourseTile extends StatelessWidget {
  const DetailCourseTile({
    Key? key,
    required this.title,
    required this.instructor,
    required this.url,
    this.badge = "오프라인",
  }) : super(key: key);
  final String title;
  final String instructor;
  final String url;
  final String badge;

  //Size
  final _cardElevation = 0.0;
  final _tileRadius = const Radius.circular(12);
  final _tileHeight = 120.0;
  final _tilePadding = 16.0;
  final _logoRadius = 4.0;
  final _centerDistance = 16.0;
  final _badgeWidth = 48.0;
  final _badgeRadius = 2.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: _cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(_tileRadius),
      ),
      child: SizedBox(
        height: _tileHeight,
        child: Padding(
          padding: EdgeInsets.all(_tilePadding),
          child: Row(
            children: [
              _logo(),
              SizedBox(width: _centerDistance),
              _infoContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_logoRadius),
      child: Container(
        color: bodyBackgroundColor,
        child: Image.network(url, height: double.infinity),
      ),
    );
  }

  Widget _infoContainer() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 2, child: _title()),
          Expanded(child: _instructorTextView()),
          Expanded(child: _statusBadge()),
        ],
      ),
    );
  }

  Widget _title() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _instructorTextView() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        instructor,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: instructorTextColor,
        ),
      ),
    );
  }

  Widget _statusBadge() {
    return Container(
      width: _badgeWidth,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: cardStatusBadgeColor,
        borderRadius: BorderRadius.circular(_badgeRadius),
      ),
      child: Text(
        badge,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 10,
        ),
      ),
    );
  }
}
