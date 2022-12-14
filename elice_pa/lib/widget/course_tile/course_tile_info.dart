import 'package:elice_pa/config/color.dart';
import 'package:flutter/material.dart';

class CourseTileInfo extends StatelessWidget {
  const CourseTileInfo({
    Key? key,
    required this.instructor,
    required this.badgeText,
  }) : super(key: key);

  final String instructor;
  final String badgeText;
  final _badgeWidth = 48.0;
  final _badgeHeight = 22.0;
  final _badgeRadius = 2.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _instructor()),
        Expanded(child: _badge()),
      ],
    );
  }

  Widget _instructor() {
    return Align(
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

  Widget _badge() {
    return Container(
      width: _badgeWidth,
      height: _badgeHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: cardStatusBadgeColor,
        borderRadius: BorderRadius.circular(_badgeRadius),
      ),
      child: Text(
        badgeText,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 10,
        ),
      ),
    );
  }
}
