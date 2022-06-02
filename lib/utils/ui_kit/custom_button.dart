import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/ui_kit/custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Widget? icon;
  final double height;
  final Color containerColor;
  final Color? borderColor;

  final Color? containerSelectedColor;
  final Color? borderSelectedColor;

  final Color textColor;
  final TextSize textSize;
  final TextType textType;

  final bool imageRight;
  final bool imageLeft;
  final MainAxisSize mainAxisSize;
  final double borderWidth;

  final ValueNotifier<bool> _highlightedNotifier = ValueNotifier<bool>(false);

  CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.imageLeft = false,
    this.imageRight = true,
    this.height = 50,
    this.borderColor,
    this.borderSelectedColor,
    this.containerColor = kWedgewood,
    this.containerSelectedColor,
    this.textColor = kPeppermint,
    this.textSize = TextSize.l,
    this.textType = TextType.regular,
    this.mainAxisSize = MainAxisSize.max,
    this.borderWidth = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ValueListenableBuilder(
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(24),
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
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisSize: mainAxisSize,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    (icon != null && imageLeft)
                        ? Container(
                            margin: const EdgeInsets.only(right: 4),
                            child: icon,
                          )
                        : const SizedBox.shrink(),
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: CustomText(
                        text,
                        textAlign: TextAlign.center,
                        size: TextSize.l,
                      ),
                    ),
                    (icon != null && imageRight)
                        ? Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: icon,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          );
        },
        valueListenable: _highlightedNotifier,
      ),
    );
  }
}
