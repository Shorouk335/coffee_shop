import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({super.key, required this.svg, this.width, this.color});
  final String svg;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svg,
      width: width,
      color: color,
    );
  }
}
