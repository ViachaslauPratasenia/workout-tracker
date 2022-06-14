import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/utils/colors.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    required this.child,
    this.padding,
    this.align,
    this.borderColor = kCello,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets? padding;
  final Alignment? align;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: align,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: child,
    );
  }
}

final customInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(16.h),
  enabledBorder: _customInputBorder,
  disabledBorder: _customInputBorder,
  focusedBorder: _customInputBorder,
  errorStyle: const TextStyle().copyWith(
    color: kAmaranth,
    fontWeight: FontWeight.w400,
  ),
  errorBorder: _customInputBorder.copyWith(
      borderSide: const BorderSide(color: kAmaranth)),
  focusedErrorBorder: _customInputBorder.copyWith(
      borderSide: const BorderSide(color: kAmaranth)),
  fillColor: Colors.transparent,
  filled: true,
);

final _customInputBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kWedgewood),
  borderRadius: BorderRadius.circular(16.r),
);
