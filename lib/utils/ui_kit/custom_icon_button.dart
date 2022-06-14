import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/utils/colors.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final double height;
  final Color containerColor;
  final Color? borderColor;

  final Color? containerSelectedColor;
  final Color? borderSelectedColor;
  final double borderWidth;

  final ValueNotifier<bool> _highlightedNotifier = ValueNotifier<bool>(false);

  CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.height = 50,
    this.borderColor,
    this.borderSelectedColor,
    this.containerColor = kWedgewood,
    this.containerSelectedColor,
    this.borderWidth = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: height,
      height: height,
      child: ValueListenableBuilder(
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: RaisedButton(
              padding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                  width: borderWidth,
                  color: !_highlightedNotifier.value
                      ? borderColor ?? Colors.transparent
                      : borderSelectedColor ?? Colors.transparent,
                ),
              ),
              color: Colors.transparent,
              animationDuration: const Duration(milliseconds: 600),
              highlightColor: containerSelectedColor,
              highlightElevation: 0,
              onPressed: onPressed,
              disabledColor: containerColor,
              disabledElevation: 0,
              onHighlightChanged: (isHighlighted) {
                _highlightedNotifier.value = isHighlighted;
              },
              elevation: 0,
              child: SizedBox(height: 50, child: icon),
            ),
          );
        },
        valueListenable: _highlightedNotifier,
      ),
    );
  }
}
