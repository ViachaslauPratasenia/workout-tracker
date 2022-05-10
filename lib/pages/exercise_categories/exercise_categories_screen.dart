import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/models/category.dart';
import 'package:workout_tracker/pages/exercise_categories/components/exercise_category_item.dart';
import 'package:workout_tracker/pages/exercise_list/exercise_list_screen.dart';
import 'package:workout_tracker/utils/ui_kit/app_bar.dart';
import 'package:workout_tracker/utils/colors.dart';

class ExerciseCategoriesScreen extends StatefulWidget {
  const ExerciseCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<ExerciseCategoriesScreen> createState() =>
      _ExerciseCategoriesScreenState();
}

class _ExerciseCategoriesScreenState extends State<ExerciseCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var categoriesList = getMainCategories();

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: CustomAppBar(
        titleStr: 'Выберите категорию',
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
              categoriesList.length,
              (index) => Expanded(
                child: Container(
                  padding: (index != 0)
                      ? EdgeInsets.only(top: 16.h)
                      : EdgeInsets.zero,
                  child: ExerciseCategoryItem(
                    category: categoriesList[index],
                    onClicked: () => Get.to(
                      () => ExerciseListScreen(
                        category: categoriesList[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
