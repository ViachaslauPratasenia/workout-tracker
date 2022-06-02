import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/ui_kit/custom_text.dart';

class BaseListItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final Widget? child;
  final String? backgroundPath;
  final double? height;

  final Function onClicked;

  const BaseListItem({
    Key? key,
    this.imagePath = '',
    this.title = '',
    this.child,
    this.backgroundPath,
    this.height,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWedgewood,
      borderRadius: BorderRadius.all(
        Radius.circular(16.r),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
        onTap: () => onClicked(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (backgroundPath != null)
              Image.asset(
                backgroundPath!,
                fit: BoxFit.fill,
              ),
            Container(
              height: height,
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
                            color: kPeppermint,
                          ),
                        if (imagePath.isNotEmpty)
                          SizedBox(
                            width: 16.w,
                          ),
                        Expanded(
                          child: CustomText(
                            title,
                            size: TextSize.m,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
