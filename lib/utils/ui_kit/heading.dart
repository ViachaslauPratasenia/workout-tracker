import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/utils/colors.dart';

enum HeadingSize { h1, h2, h3, h4, h5 }
enum HeadingType { bold, medium, book }

class Heading extends StatelessWidget {
  const Heading(
      this.title, {
        Key? key,
        required this.size,
        this.type = HeadingType.medium,
        this.textAlign = TextAlign.left,
        this.color = kTextColor,
        this.fontWeight,
        this.maxLines,
        this.overflow,
        this.letterSpacing,
      }) : super(key: key);

  final String title;
  final HeadingSize size;
  final HeadingType type;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final Color color;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;

  _getFontSize() {
    switch (size) {
      case HeadingSize.h1:
        return 25.sp;

      case HeadingSize.h2:
        return 22.sp;

      case HeadingSize.h3:
        return 18.sp;

      case HeadingSize.h4:
        return 17.sp;

      case HeadingSize.h5:
        return 14.sp;

      default:
        throw Exception("Invalid heading size");
    }
  }

  _getFontWeight() {
    if (fontWeight != null) {
      return fontWeight;
    }

    switch (type) {
      case HeadingType.bold:
        return FontWeight.bold;

      case HeadingType.medium:
        return FontWeight.w500;

      case HeadingType.book:
        return FontWeight.normal;

      default:
        throw Exception("Invalid heading type");
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
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontWeight: fontWidth,
        color: color,
      ),
    );
  }
}
