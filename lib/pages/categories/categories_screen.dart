import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/models/categories.dart';
import 'package:workout_tracker/models/category.dart';
import 'package:workout_tracker/pages/categories/components/exercise_category_item.dart';
import 'package:workout_tracker/pages/exercise_list/exercise_list_screen.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/ui_kit/app_bar.dart';

class CategoriesScreen extends StatelessWidget {
  final CategoriesType categoriesType;

  const CategoriesScreen({Key? key, required this.categoriesType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categories = (categoriesType == CategoriesType.categories)
        ? getMainCategories()
        : getExerciseCategories();

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
              categories.length,
              (index) => Expanded(
                child: Container(
                  padding: (index != 0)
                      ? EdgeInsets.only(top: 16.h)
                      : EdgeInsets.zero,
                  child: ExerciseCategoryItem(
                    category: categories[index],
                    onClicked: () {
                      //todo
                      if (categories[index].title == 'Готовая тренировка') {
                        // Get.to(
                        //       () => ExerciseListScreen(category: categories[index]),
                        // )
                        return;
                      }

                      if (categories[index].title == 'Список Упражнений') {
                        Get.to(
                          () => const CategoriesScreen(
                            categoriesType: CategoriesType.exercises,
                          ), preventDuplicates: false
                        );
                        return;
                      }

                      Get.to(
                        () => ExerciseListScreen(category: categories[index]),
                      );
                    },
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
