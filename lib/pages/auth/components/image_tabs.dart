import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/images.dart';
import 'package:workout_tracker/utils/ui_kit/custom_text.dart';
import 'package:workout_tracker/utils/ui_kit/tabs.dart';

enum ETabs { login, signUp }

class ImageTabs extends StatelessWidget {
  final ETabs currentTab;

  const ImageTabs({
    Key? key,
    this.currentTab = ETabs.login,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.defaultSize.height * 0.73,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Image.asset(
            Images.loginBg,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Padding(
            padding:
                EdgeInsets.only(top: ScreenUtil().statusBarHeight + 24.h),
            child: Tabs(
              selectedIndex: currentTab == ETabs.login ? 0 : 1,
              children: const ['Login', 'Sign up'],
            ),
          ),
          Positioned(
            bottom: 80.h,
            left: 16.w,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontSize: 40.sp,
                      color: kPeppermint,
                      fontWeight: FontWeight.w400,
                    ),
                    text: 'Welcome to\n',
                  ),
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontSize: 40.sp,
                      color: kPeppermint,
                      fontWeight: FontWeight.w600,
                    ),
                    text: 'Workout Tracker',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
