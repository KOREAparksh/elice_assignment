import 'package:elice_pa/config/color.dart';
import 'package:flutter/material.dart';

class CourseLogo extends StatelessWidget {
  const CourseLogo({
    Key? key,
    required this.url,
    required this.radius,
    required this.size,
    this.backgroundColor = bodyBackgroundColor,
  }) : super(key: key);
  final String? url;
  final double size;
  final double radius;
  final Color backgroundColor;

  final _default = "assets/default_logo.png";

  @override
  Widget build(BuildContext context) {
    return (url != null || url == "") ? _logoUrl(url!) : _logoDefault();
  }

  Widget _logoUrl(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        color: bodyBackgroundColor,
        child: Image.network(
          url,
          width: size,
          height: size,
        ),
      ),
    );
  }

  Widget _logoDefault() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        color: bodyBackgroundColor,
        child: Image.asset(
          _default,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
