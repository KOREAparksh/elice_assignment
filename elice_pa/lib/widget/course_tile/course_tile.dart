import 'package:elice_pa/config/color.dart';
import 'package:elice_pa/widget/course_tile/course_logo.dart';
import 'package:elice_pa/widget/course_tile/course_tile_info.dart';
import 'package:flutter/material.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    Key? key,
    required this.title,
    required this.url,
    required this.instructor,
    this.badgeText = "오프라인",
  }) : super(key: key);
  final String title;
  final String instructor;
  final String? url;
  final String badgeText;

  //info
  final _cardElevation = 7.0;

  //Size
  final _tileWidth = 160.0;
  final _tileTopRatio = 136;
  final _tileBottomRatio = 64;
  final _tileRadius = const Radius.circular(8);
  final _logoSize = 44.0;
  final _logoRadius = 4.0;

  //MarginPadding
  final _bottomContainerTopBottomPadding = 10.0;
  final _sidePadding = 12.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: _cardElevation,
      shadowColor: cardShadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(_tileRadius),
      ),
      child: InkWell(
        onTap: () => showTouchable(context),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          children: [
            _topContainer(),
            _bottomContainer(),
          ],
        ),
      ),
    );
  }

// 과제요구사항을 위한 임시 메소드
  void showTouchable(context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Touch!"), duration: Duration(milliseconds: 500)));
  }

  Widget _topContainer() {
    return Expanded(
      flex: _tileTopRatio,
      child: Container(
        width: _tileWidth,
        padding: EdgeInsets.fromLTRB(_sidePadding, 0, _sidePadding, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: _tileRadius,
            topRight: _tileRadius,
          ),
          color: cardBackgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CourseLogo(url: url, radius: _logoRadius, size: _logoSize),
            // const SizedBox(height: 14),
            _courseTitleView()
          ],
        ),
      ),
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
      flex: _tileBottomRatio,
      child: Container(
        width: _tileWidth,
        padding: EdgeInsets.fromLTRB(
          _sidePadding,
          _bottomContainerTopBottomPadding,
          _sidePadding,
          _bottomContainerTopBottomPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: _tileRadius,
            bottomRight: _tileRadius,
          ),
          color: Colors.white,
        ),
        child: CourseTileInfo(
          instructor: instructor,
          badgeText: badgeText,
        ),
      ),
    );
  }
}
