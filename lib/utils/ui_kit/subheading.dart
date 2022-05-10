import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/utils/colors.dart';

enum SubheadingSize { m, s, xs }

class Subheading extends StatelessWidget {
  const Subheading(
      this.title, {
        Key? key,
        required this.size,
        this.textAlign = TextAlign.left,
        this.color = kLightBlue,
        this.decoration = TextDecoration.none,
        this.fontWeight,
        this.overflow,
        this.maxLines,
        this.letterSpacing,
      }) : super(key: key);

  final String title;
  final SubheadingSize size;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final Color color;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;

  _getFontSize() {
    switch (size) {
      case SubheadingSize.m:
        return 16.sp;

      case SubheadingSize.s:
        return 13.sp;

      case SubheadingSize.xs:
        return 11.sp;

      default:
        throw Exception("Invalid subheading size");
    }
  }

  _getFontWeight() {
    if (fontWeight != null) {
      return fontWeight;
    }

    switch (size) {
      case SubheadingSize.m:
        return FontWeight.w500;

      default:
        return FontWeight.normal;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = _getFontSize();
    final fontWidth = _getFontWeight();

    return Text(
      title,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWidth,
        color: color,
        decoration: decoration,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
