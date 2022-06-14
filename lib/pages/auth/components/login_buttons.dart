import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_tracker/di/di.dart';
import 'package:workout_tracker/pages/auth/controller/auth_controller.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/images.dart';
import 'package:workout_tracker/utils/ui_kit/custom_button.dart';
import 'package:workout_tracker/utils/ui_kit/custom_icon_button.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController controller = DI.find();

    return Row(
      children: [
        CustomIconButton(
          onPressed: controller.onAppleClicked,
          icon: SvgPicture.asset(
            Images.appleIcon,
            width: 24.w,
            height: 24.w,
            color: kPeppermint,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        CustomIconButton(
          onPressed: controller.onGoogleClicked,
          icon: SvgPicture.asset(
            Images.googleIcon,
            width: 24.w,
            height: 24.w,
            color: kPeppermint,
          ),
        ),
        const Spacer(),
        CustomButton(
          onPressed: controller.onLoginClicked,
          text: 'Login',
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 18.w,
            color: kPeppermint,
          ),
        )
      ],
    );
  }
}
