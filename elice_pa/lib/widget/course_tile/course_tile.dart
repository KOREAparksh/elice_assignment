import 'package:elice_pa/config/color.dart';
import 'package:elice_pa/widget/course_tile/course_tile_info.dart';
import 'package:flutter/material.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    Key? key,
    required this.title,
    required this.url,
    this.instructor = "선생님 미등록",
    this.badgeText = "오프라인",
  }) : super(key: key);
  final String title;
  final String instructor;
  final String url;
  final String badgeText;

  //info
  final _cardElevation = 7.0;

  //Size
  final _tileWidth = 160.0;
  final _tileTopHeight = 136;
  final _tileBottomHeight = 64;
  final _tileRadius = const Radius.circular(8);
  final _logoSize = 44.0;
  final _logoRadius = 4.0;

  //MarginPadding
  final _topBottomPadding = 10.0;
  final _sidePadding = 12.0;

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
      child: Image.network(url, width: _logoSize),
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
        child: CourseTileInfo(
          instructor: instructor,
          badgeText: badgeText,
        ),
      ),
    );
  }
}
