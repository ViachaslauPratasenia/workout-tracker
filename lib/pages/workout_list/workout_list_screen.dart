import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/di/di.dart';
import 'package:workout_tracker/models/categories.dart';
import 'package:workout_tracker/models/category.dart';
import 'package:workout_tracker/pages/workout_list/components/workout_list_item.dart';
import 'package:workout_tracker/storage/basic_exercises_storage.dart';
import 'package:workout_tracker/storage/workouts_storage.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/images.dart';
import 'package:workout_tracker/utils/ui_kit/app_bar.dart';
import 'package:workout_tracker/utils/ui_kit/base_list_item.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = DI.find<WorkoutsStorage>().getAllWorkoutsList();

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: CustomAppBar(
        titleStr: 'Готовые тренировки',
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: WorkoutListItem(
                  workout: item,
                  onClicked: () {},
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
