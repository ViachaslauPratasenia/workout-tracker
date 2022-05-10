import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/ui_kit/heading.dart';

class ExerciseListItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function onClicked;

  const ExerciseListItem({
    Key? key,
    this.imagePath = '',
    this.title = '',
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                width: 36.w,
                height: 36.w,
                color: kTextColor,
              ),
              SizedBox(
                width: 16.w,
              ),
              Heading(
                title,
                size: HeadingSize.h4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
