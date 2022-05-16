import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/models/categories.dart';
import 'package:workout_tracker/pages/categories/categories_screen.dart';
import 'package:workout_tracker/pages/home/bottom_navigation/bottom_navigation_item.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/ui_kit/app_bar.dart';
import 'package:workout_tracker/utils/ui_kit/base_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: kPrimaryColor,
      activeNavigationItem: BottomNavigationItem.workout,
      topPadding: ScreenUtil().statusBarHeight,
      appBar: CustomAppBar(
        titleStr: 'Workout tracker',
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 20.w,
            icon: const Icon(
              Icons.calendar_today_outlined,
              color: kTextColor,
            ),
          ),
        ],
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: FloatingActionButton(
                onPressed: () {
                  Get.to(
                    () => const CategoriesScreen(
                        categoriesType: CategoriesType.categories),
                  );
                },
                backgroundColor: kSecondaryColor,
                child: const Icon(
                  Icons.add,
                  color: kTextColor,
                ),
              ),
              right: 24,
              bottom: 24,
            ),
          ],
        ),
      ),
    );
  }
}
