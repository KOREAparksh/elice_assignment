import 'package:elice_pa/config/color.dart';
import 'package:elice_pa/cubit/course_cubit.dart';
import 'package:elice_pa/cubit/free_course_cubit.dart';
import 'package:elice_pa/cubit/recommend_course_cubit.dart';
import 'package:elice_pa/dto/course_dto.dart';
import 'package:elice_pa/screen/detail_course_screen.dart';
import 'package:elice_pa/util/converter.dart';
import 'package:elice_pa/widget/course_list.dart';
import 'package:elice_pa/widget/course_tile/course_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  //Size
  final _listHeight = 200.0;

  //MarginPadding
  final _appBarActionPadding = 14.0;
  final _bodyTopPadding = 22.0;
  final _sidePadding = 16.0;

  //Asset
  final _titleLogo = "assets/logo.png";

  //str
  final _recommendTitle = "추천 과목";
  final _freeTitle = "무료 과목";
  final detailButtonText = "전체보기";

  @override
  void initState() {
    super.initState();
    final recommendCubit = context.read<RecommendCourseCubit>();
    recommendCubit.getCourse(temp: []);
    final freeCubit = context.read<FreeCourseCubit>();
    freeCubit.getCourse(temp: []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Image.asset(_titleLogo),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none, color: Colors.black54),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {},
        ),
        SizedBox(width: _appBarActionPadding),
      ],
    );
  }

  Widget _body() {
    return Column(
      children: [
        SizedBox(height: _bodyTopPadding),
        _courseListTitle(
          title: _recommendTitle,
          onTap: _goRecommendDetail,
        ),
        recommendCourseListView(),
        SizedBox(height: _bodyTopPadding),
        _courseListTitle(
          title: _freeTitle,
          onTap: _goFreeDetail,
        ),
        freeCourseListView(),
      ],
    );
  }

  Future<dynamic> _goRecommendDetail() {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DetailCourseScreen(
          courseType: CourseType.RECOMMEND,
        ),
      ),
    );
  }

  Future<dynamic> _goFreeDetail() {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DetailCourseScreen(
          courseType: CourseType.FREE,
        ),
      ),
    );
  }

  Widget recommendCourseListView() {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: _listHeight),
      child: BlocBuilder<RecommendCourseCubit, CourseState>(
        builder: (context, state) {
          if (state is CourseLoaded) {
            return CourseListView(courses: state.courses);
          } else if (state is CourseError) {
            return Text(state.message);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget freeCourseListView() {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: _listHeight),
      child: BlocBuilder<FreeCourseCubit, CourseState>(
        builder: (context, state) {
          if (state is CourseLoaded) {
            return CourseListView(courses: state.courses);
          } else if (state is CourseError) {
            return Text(state.message);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _courseListTitle(
      {required String title, required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.only(left: _sidePadding, right: _sidePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _subjectTitle(title),
          _detailTextButton(onTap),
        ],
      ),
    );
  }

  Text _subjectTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _detailTextButton(VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: buttonMainColor,
        textStyle: Theme.of(context).textTheme.labelMedium,
      ),
      child: Text(
        detailButtonText,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
