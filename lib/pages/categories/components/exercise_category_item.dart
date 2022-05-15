import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/models/category.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/ui_kit/base_list_item.dart';
import 'package:workout_tracker/utils/ui_kit/heading.dart';

class ExerciseCategoryItem extends StatelessWidget {
  final Category category;
  final Function onClicked;

  const ExerciseCategoryItem({
    Key? key,
    required this.category,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseListItem(
      onClicked: onClicked,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              category.imagePath,
              width: 100.w,
              height: 100.w,
              color: kTextColor,
            ),
            SizedBox(
              height: 16.h,
            ),
            Heading(
              category.title,
              size: HeadingSize.h3,
            ),
          ],
        ),
      ),
    );
  }
}
