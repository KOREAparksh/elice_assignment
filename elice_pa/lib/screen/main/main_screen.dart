import 'package:elice_pa/config/color.dart';
import 'package:elice_pa/cubit/free_course_cubit.dart';
import 'package:elice_pa/cubit/recommend_course_cubit.dart';
import 'package:elice_pa/dto/course_dto.dart';
import 'package:elice_pa/screen/detail_course_screen.dart';
import 'package:elice_pa/util/converter.dart';
import 'package:elice_pa/widget/course_tile/course_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Data
  int _selectedIndex = 0;
  final List<Course> recommendCourses = [];
  final List<Course> freeCourses = [];

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
  final String _bottomNaviHome = "Home";
  final String _bottomNaviQR = "QR";

  @override
  void initState() {
    super.initState();
    final recommendCubit = context.read<RecommendCourseCubit>();
    recommendCubit.getRecommendCourse();
    final freeCubit = context.read<FreeCourseCubit>();
    freeCubit.getFreeCourse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
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
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailCourseScreen(
                          initCourses: recommendCourses,
                          courseType: CourseType.RECOMMEND,
                        )));
          },
        ),
        recommendCourseListView(),
        SizedBox(height: _bodyTopPadding),
        _courseListTitle(
          title: _freeTitle,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailCourseScreen(
                          initCourses: freeCourses,
                          courseType: CourseType.FREE,
                        )));
          },
        ),
        freeCourseListView(),
      ],
    );
  }

  Widget recommendCourseListView() {
    return BlocBuilder<RecommendCourseCubit, RecommendCourseState>(
      builder: (context, state) {
        if (state is RecommendCourseLoaded) {
          recommendCourses.clear();
          recommendCourses.addAll(state.recommendCourses.courses);
          return CourseListView(courses: recommendCourses);
        } else if (state is RecommendCourseError) {
          return Text(state.message);
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget freeCourseListView() {
    return BlocBuilder<FreeCourseCubit, FreeCourseState>(
      builder: (context, state) {
        if (state is FreeCourseLoaded) {
          freeCourses.clear();
          freeCourses.addAll(state.freeCourses.courses);
          return CourseListView(courses: freeCourses);
        } else if (state is FreeCourseError) {
          return Text(state.message);
        }
        return const CircularProgressIndicator();
      },
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

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_balance_outlined),
          label: _bottomNaviHome,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.camera_alt_outlined),
          label: _bottomNaviQR,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: selectedMainColor,
      onTap: _onTapNavigatorItem,
    );
  }

  void _onTapNavigatorItem(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }
}

class CourseListView extends StatelessWidget {
  const CourseListView({
    Key? key,
    required this.courses,
  }) : super(key: key);

  //Data
  final List<Course> courses;

  //Size
  final _listHeight = 200.0;
  final _cardSeparateWidth = 10.0;
  final _sidePadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: _listHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: (courses.length > 10) ? 10 : courses.length,
            itemBuilder: _itemBuilder,
            separatorBuilder: _separatorBuilder,
          ),
        ),
      ],
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    double leftPadding = (index == 0) ? _sidePadding : 0;
    double rightPadding = (index == courses.length - 1) ? _sidePadding : 0;

    return Container(
      margin: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: CourseTile(
        title: titleConverter(courses[index].title),
        instructor: instructorConverter(courses[index].instructors),
        url: courses[index].logoFileUrl,
      ),
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) =>
      SizedBox(width: _cardSeparateWidth);
}
