import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_tracker/di/di.dart';
import 'package:workout_tracker/pages/auth/components/email_input.dart';
import 'package:workout_tracker/pages/auth/components/image_tabs.dart';
import 'package:workout_tracker/pages/auth/components/login_buttons.dart';
import 'package:workout_tracker/pages/auth/components/password_input.dart';
import 'package:workout_tracker/pages/auth/controller/auth_controller.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/images.dart';
import 'package:workout_tracker/utils/input.dart';
import 'package:workout_tracker/utils/ui_kit/base_screen.dart';
import 'package:workout_tracker/utils/ui_kit/custom_text.dart';
import 'package:workout_tracker/utils/ui_kit/unfocus_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DI.put(AuthController());

    return BaseScreen(
      backgroundColor: kCello,
      child: UnfocusView(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: ImageTabs(
                currentTab: ETabs.login,
              ),
            ),
            const EmailInput(),
            SizedBox(
              height: 8.h,
            ),
            const PasswordInput(),
            SizedBox(
              height: 4.h,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: TextButton(
                  onPressed: controller.onForgotPasswordClicked,
                  child: const CustomText(
                    'Forgot Password',
                    size: TextSize.m,
                    type: TextType.semiBold,
                    color: kAquaIsland,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 32.h, left: 32.h, right: 32.h),
              child: const LoginButtons(),
            )
          ],
        ),
      ),
    );
  }
}
