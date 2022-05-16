import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/pages/home/bottom_navigation/bottom_navigation_item.dart';
import 'package:workout_tracker/utils/colors.dart';

class BottomNavigation extends StatelessWidget {
  final BottomNavigationItem activeItem;

  const BottomNavigation({
    Key? key,
    required this.activeItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: Column(
        children: [
          Container(
            width: ScreenUtil().screenWidth,
            height: 0.5,
            color: kTextColor,
          ),
          Expanded(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: _NavigationItem(
                        BottomNavigationItem.workout, activeItem)),
                Expanded(
                    child: _NavigationItem(
                        BottomNavigationItem.manual, activeItem)),
                Expanded(
                    child: _NavigationItem(
                        BottomNavigationItem.progress, activeItem)),
                Expanded(
                    child: _NavigationItem(
                        BottomNavigationItem.profile, activeItem)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final BottomNavigationItem item;
  final BottomNavigationItem activeItem;

  const _NavigationItem(this.item, this.activeItem);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => Get.off(
          () => item.screen,
          duration: Duration.zero,
          preventDuplicates: false,
        ),
        child: SizedBox(
          height: 56.h,
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Image.asset(
              item.image,
              color: activeItem == item ? kTextColor : kSecondaryColor,
              // fit: BoxFit.fill,
              width: 20.w,
              height: 20.w,
            ),
          ),
        ),
      ),
    );
    // return SizedBox(
    //   height: 48,
    //   child: GestureDetector(
    //     onTap: () => Get.off(
    //       () => item.screen,
    //       duration: Duration.zero,
    //       preventDuplicates: false,
    //     ),
    //     child: Container(
    //       padding: EdgeInsets.all(12),
    //       child: Image.asset(
    //         item.image,
    //         color: activeItem == item ? kTextColor : kSecondaryColor,
    //         // fit: BoxFit.fill,
    //       ),
    //     ),
    //   ),
    // );
  }
}
