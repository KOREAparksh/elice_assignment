import 'package:elice_pa/config/color.dart';
import 'package:elice_pa/widget/course_tile/course_logo.dart';
import 'package:elice_pa/widget/course_tile/course_tile.dart';
import 'package:elice_pa/widget/course_tile/course_tile_info.dart';
import 'package:flutter/material.dart';

class DetailCourseTile extends StatelessWidget {
  const DetailCourseTile({
    Key? key,
    required this.title,
    required this.instructor,
    required this.url,
    this.badgeText = "오프라인",
  }) : super(key: key);
  final String title;
  final String instructor;
  final String? url;
  final String badgeText;

  //Size
  final _cardElevation = 0.0;
  final _tileRadius = const Radius.circular(12);
  final _tileHeight = 120.0;
  final _tilePadding = 16.0;
  final _logoRadius = 4.0;
  final _centerDistance = 16.0;

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
              CourseLogo(
                url: url,
                radius: _logoRadius,
                height: double.infinity,
              ),
              SizedBox(width: _centerDistance),
              _infoContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoContainer() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: _title()),
          Expanded(child: _courseTileInfo()),
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

  Widget _courseTileInfo() {
    return CourseTileInfo(
      instructor: instructor,
      badgeText: badgeText,
    );
  }
}