import 'package:elice_pa/dto/course_dto.dart';
import 'package:elice_pa/util/converter.dart';
import 'package:elice_pa/widget/course_tile/course_tile.dart';
import 'package:flutter/material.dart';

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
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: _listHeight),
      child: (courses.isEmpty)
          ? Center(
              child: Text("텅..."),
            )
          : _listview(),
    );
  }

  Widget _listview() {
    return SizedBox(
      height: _listHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: (courses.length > 10) ? 10 : courses.length,
        itemBuilder: _itemBuilder,
        separatorBuilder: _separatorBuilder,
      ),
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
