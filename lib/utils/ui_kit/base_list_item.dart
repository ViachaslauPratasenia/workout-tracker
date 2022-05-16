import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/ui_kit/heading.dart';

class BaseListItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final Widget? child;

  final Function onClicked;

  const BaseListItem({
    Key? key,
    this.imagePath = '',
    this.title = '',
    this.child,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kSecondaryColor,
      borderRadius: BorderRadius.all(
        Radius.circular(16.r),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
        onTap: () => onClicked(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: (child != null)
              ? child
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (imagePath.isNotEmpty)
                      Image.asset(
                        imagePath,
                        width: 36.w,
                        height: 36.w,
                        color: kTextColor,
                      ),
                    if (imagePath.isNotEmpty)
                      SizedBox(
                        width: 16.w,
                      ),
                    Expanded(
                      child: Heading(
                        title,
                        size: HeadingSize.h4,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
