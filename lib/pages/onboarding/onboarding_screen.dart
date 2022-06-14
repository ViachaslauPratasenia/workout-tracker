import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/pages/auth/login_screen.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/images.dart';
import 'package:workout_tracker/utils/ui_kit/base_screen.dart';
import 'package:workout_tracker/utils/ui_kit/custom_button.dart';
import 'package:workout_tracker/utils/ui_kit/custom_text.dart';
import 'package:workout_tracker/utils/ui_kit/dots.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  late final PageController _pageController;

  final Map<String, String> data = {
    Images.firstOnboardingBg: 'Find the right workout for what you need',
    Images.secondOnboardingBg: 'Create a workout plan to stay fit',
    Images.thirdOnboardingBg: 'Action is the key to all success',
  };

  @override
  void initState() {
    _pageController = PageController(initialPage: currentPage);
    super.initState();
  }

  void Function() _onPressed(bool isLastPage) => () {
        if (isLastPage) {
          Get.to(() => const LoginScreen());
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        }
      };

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentPage == data.length - 1;
    final buttonText = isLastPage ? 'Let\'s start!' : 'Next';

    return BaseScreen(
      backgroundColor: kCello,
      child: SizedBox(
        width: double.infinity,
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          itemCount: data.length,
          itemBuilder: (context, index) {
            var image = data.keys.toList()[index];
            var text = data[image] ?? '';

            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: 64.h, left: 32.w, right: 32.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text,
                          textAlign: TextAlign.center,
                          type: TextType.semiBold,
                          size: TextSize.h4,
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Dots(length: data.length, currentIndex: index,),
                        SizedBox(
                          height: 32.h,
                        ),
                        CustomButton(
                          onPressed: _onPressed(isLastPage),
                          text: buttonText,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
