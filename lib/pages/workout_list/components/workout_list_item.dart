import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/models/category.dart';
import 'package:workout_tracker/models/workout/workout.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/images.dart';
import 'package:workout_tracker/utils/ui_kit/base_list_item.dart';
import 'package:workout_tracker/utils/ui_kit/heading.dart';
import 'package:workout_tracker/utils/ui_kit/subheading.dart';

import '../../../models/categories.dart';

class WorkoutListItem extends StatelessWidget {
  final Workout workout;
  final Function onClicked;

  const WorkoutListItem({
    Key? key,
    required this.workout,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseListItem(
      onClicked: onClicked,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            workoutIconsMap[workout.id] ?? '',
            width: 36.w,
            height: 36.w,
            color: Colors.white,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading(
                  workout.title,
                  size: HeadingSize.h4,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Subheading(
                      '${workout.days.length} дней',
                      size: SubheadingSize.m,
                    ),
                    SizedBox(width: 8.w),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        workout.level,
                        (index) {
                          return Padding(
                            padding: (index != 0)
                                ? EdgeInsets.only(left: 4.w)
                                : EdgeInsets.zero,
                            child: Image.asset(
                              Images.starIcon,
                              width: 16.w,
                              height: 16.w,
                              color: kTextColor,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
