import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/utils/colors.dart';

class Dots extends StatelessWidget {
  final int length;
  final int currentIndex;
  final Color activeColor;
  final Color dotsColor;

  const Dots({
    Key? key,
    this.length = 0,
    this.currentIndex = 0,
    this.activeColor = kPeppermint,
    this.dotsColor = kWedgewood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: EdgeInsets.only(right: 8.w),
            height: 8.h,
            width: currentIndex == index ? 36.w : 12.w,
            decoration: BoxDecoration(
              color: currentIndex == index ? activeColor : dotsColor,
              borderRadius: BorderRadius.circular(30.r),
            ),
          );
        },
      ),
    );
  }
}
