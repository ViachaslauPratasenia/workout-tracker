import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/di/di.dart';
import 'package:workout_tracker/models/category.dart';
import 'package:workout_tracker/storage/basic_exercises_storage.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/images.dart';
import 'package:workout_tracker/utils/ui_kit/app_bar.dart';
import 'package:workout_tracker/utils/ui_kit/base_list_item.dart';

class ExerciseListScreen extends StatelessWidget {
  final Category category;

  const ExerciseListScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = DI
        .find<BasicExerciseStorage>()
        .getExerciseListByType(category.getTypeByCategory());

    return Scaffold(
      backgroundColor: kCello,
      appBar: CustomAppBar(
        titleStr: category.title,
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
                child: BaseListItem(
                  onClicked: () {},
                  // imagePath: Images.cardioIcon,
                  title: item.name,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
