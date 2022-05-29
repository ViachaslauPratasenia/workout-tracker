import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/models/categories.dart';
import 'package:workout_tracker/models/workout/workout.dart';
import 'package:workout_tracker/utils/ui_kit/heading.dart';
import 'package:workout_tracker/utils/ui_kit/subheading.dart';

class DescriptionTitle extends StatelessWidget {
  final Workout workout;

  const DescriptionTitle({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          workoutBackgroundImagesMap[workout.id] ?? '',
          height: 200.h,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Heading(
                    levelMaps[workout.level] ?? '',
                    size: HeadingSize.h4,
                  ),
                  const Subheading(
                    'Level',
                    size: SubheadingSize.s,
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Heading(
                    '${workout.days.length}',
                    size: HeadingSize.h4,
                  ),
                  const Subheading(
                    'Days',
                    size: SubheadingSize.s,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
