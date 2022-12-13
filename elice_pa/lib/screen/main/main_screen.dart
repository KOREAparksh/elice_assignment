import 'package:elice_pa/config/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Data
  int _selectedIndex = 0;

  //MarginPadding
  final _appBarActionPadding = 14.0;
  final _bodyTopPadding = 22.0;

  //Asset
  final _logo = "assets/logo.png";

  //str
  final _recommendTitle = "추천 과목";
  final _freeTitle = "무료 과목";
  final String _bottomNaviHome = "Home";
  final String _bottomNaviQR = "QR";

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
      title: Image.asset(_logo),
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
        CourseListView(title: _recommendTitle),
        SizedBox(height: _bodyTopPadding),
        CourseListView(title: _freeTitle),
      ],
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
    required this.title,
  }) : super(key: key);
  final title;

  //Size
  final _listHeight = 200.0;
  final _cardSeparateWidth = 10.0;
  final _sidePadding = 16.0;

  //Text
  final detailButtonText = "전체보기";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _courseListTitle(context),
        _courseList(),
      ],
    );
  }

  Widget _courseListTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: _sidePadding, right: _sidePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _subjectTitle(),
          _detailTextButton(context),
        ],
      ),
    );
  }

  Text _subjectTitle() {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _detailTextButton(BuildContext context) {
    return TextButton(
      onPressed: _onTapDetailButton,
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

  Widget _courseList() {
    return SizedBox(
      height: _listHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 22,
        cacheExtent: 22,
        itemBuilder: (BuildContext context, int index) {
          double leftPadding = (index == 0) ? _sidePadding : 0;
          double rightPadding = (index == 22 - 1) ? _sidePadding : 0;
          return Container(
            margin: EdgeInsets.only(left: leftPadding, right: rightPadding),
            child: CourseTile(
              title: "캐글 문제 풀이로 배우는 데이터 분석",
              instructor: "박승한 선생님",
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: _cardSeparateWidth),
      ),
    );
  }

  void _onTapDetailButton() {}
}

class CourseTile extends StatelessWidget {
  const CourseTile(
      {Key? key,
      required this.title,
      this.instructor = "선생님 미등록",
      this.badge = "오프라인"})
      : super(key: key);
  final String title;
  final String instructor;
  final String badge;

  //info
  final _cardElevation = 7.0;

  //Size
  final _tileWidth = 160.0;
  final _tileTopHeight = 136;
  final _tileBottomHeight = 64;
  final _tileRadius = const Radius.circular(8);
  final _logoSize = 44.0;
  final _logoRadius = 4.0;
  final _badgeWidth = 48.0;
  final _badgeHeight = 22.0;
  final _badgeRadius = 2.0;

  //MarginPadding
  final _topBottomPadding = 10.0;
  final _sidePadding = 12.0;

  final _tempLogo =
      "https://cdn-api.elice.io/api/file/965383b87b6844efbf40e246bf55f13a/%E1%84%80%E1%85%AA%E1%84%86%E1%85%A9%E1%86%A8%E1%84%85%E1%85%A9%E1%84%80%E1%85%A9%28208_208%29.png?se=2022-12-22T00%3A15%3A00Z&sp=rt&sv=2020-10-02&sr=b&sig=kneXE5f6/Ngghiz46%2BKWyY9VtFYtTIoMMxRFlnFQAmg%3D";

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: _cardElevation,
      shadowColor: cardShadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(_tileRadius),
      ),
      child: Column(
        children: [
          _topContainer(),
          _bottomContainer(),
        ],
      ),
    );
  }

  Widget _topContainer() {
    return Expanded(
      flex: _tileTopHeight,
      child: Container(
        width: _tileWidth,
        padding: EdgeInsets.all(_sidePadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: _tileRadius,
            topRight: _tileRadius,
          ),
          color: cardBackgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _courseLogo(),
            const SizedBox(height: 14),
            _courseTitleView()
          ],
        ),
      ),
    );
  }

  Widget _courseLogo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_logoRadius),
      child: Image.network(_tempLogo, width: _logoSize),
    );
  }

  Widget _courseTitleView() {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  Widget _bottomContainer() {
    return Expanded(
      flex: _tileBottomHeight,
      child: Container(
        width: _tileWidth,
        padding: EdgeInsets.fromLTRB(
            _sidePadding, _topBottomPadding, _sidePadding, _topBottomPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: _tileRadius,
            bottomRight: _tileRadius,
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _instructorTextView(),
            _statusBadge(),
          ],
        ),
      ),
    );
  }

  Text _instructorTextView() {
    return Text(
      instructor,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: instructorTextColor,
      ),
    );
  }

  Widget _statusBadge() {
    return Container(
      width: _badgeWidth,
      height: _badgeHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: cardStatusBadgeColor,
        borderRadius: BorderRadius.circular(_badgeRadius),
      ),
      child: Text(
        badge,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    );
  }
}
