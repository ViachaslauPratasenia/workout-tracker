import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/utils/colors.dart';

enum TextSize { h1, h2, h3, h4, xxl, xl, l, m, s }
enum TextType { bold, semiBold, regular }

class CustomText extends StatelessWidget {
  const CustomText(
    this.title, {
    Key? key,
    required this.size,
    this.type = TextType.regular,
    this.textAlign = TextAlign.left,
    this.color = kPeppermint,
    this.fontWeight,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
  }) : super(key: key);

  final String title;
  final TextSize size;
  final TextType type;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final Color color;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;

  _getFontSize() {
    switch (size) {
      case TextSize.h1:
        return 48.sp;

      case TextSize.h2:
        return 42.sp;

      case TextSize.h3:
        return 36.sp;

      case TextSize.h4:
        return 28.sp;

      case TextSize.xxl:
        return 22.sp;

      case TextSize.xl:
        return 20.sp;

      case TextSize.l:
        return 18.sp;

      case TextSize.m:
        return 17.sp;

      case TextSize.s:
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
      case TextType.bold:
        return FontWeight.bold;

      case TextType.semiBold:
        return FontWeight.w600;

      case TextType.regular:
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
