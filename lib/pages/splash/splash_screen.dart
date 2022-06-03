import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/di/di.dart';
import 'package:workout_tracker/pages/onboarding/onboarding_screen.dart';
import 'package:workout_tracker/pages/splash/controller/splash_controller.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/images.dart';
import 'package:workout_tracker/utils/ui_kit/custom_button.dart';
import 'package:workout_tracker/utils/ui_kit/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DI.put(SplashController());
    return Scaffold(
      backgroundColor: kCello,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            Images.splashBg,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: const CustomText(
                'Workout Tracker',
                size: TextSize.h1,
                type: TextType.semiBold,
                color: kAquaIsland,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Obx(
            () => AnimatedOpacity(
              opacity: controller.needShowInfo.value ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 100),
              child: Padding(
                padding: EdgeInsets.only(bottom: 64.h),
                child: CupertinoActivityIndicator(
                  animating: true,
                  color: kAquaIsland,
                  radius: 32.r,
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedOpacity(
              opacity: controller.needShowInfo.value ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 400),
              child: Padding(
                padding: EdgeInsets.only(bottom: 64.h, left: 36.w, right: 36.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomText(
                      'Are you ready for the next challenge?',
                      textAlign: TextAlign.center,
                      type: TextType.semiBold,
                      size: TextSize.h4,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomButton(
                      onPressed: () => Get.off(() => const OnboardingScreen()),
                      text: 'Start now',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
