import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/models/category.dart';
import 'package:workout_tracker/pages/exercise_list/exercise_list_item.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/images.dart';
import 'package:workout_tracker/utils/ui_kit/app_bar.dart';

class ExerciseListScreen extends StatelessWidget {
  final Category category;

  const ExerciseListScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: CustomAppBar(
        titleStr: category.title,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: ListView.builder(
            itemCount: 16,
            itemBuilder: (context, index) {
              // final item = likes[index];

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: ExerciseListItem(onClicked: () {}, imagePath: Images.cardioIcon, title: 'Армейские отжимания',),
              );
            },
          ),
        ),
      ),
    );
  }
}
