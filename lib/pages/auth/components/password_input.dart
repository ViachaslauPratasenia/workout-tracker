import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_tracker/di/di.dart';
import 'package:workout_tracker/pages/auth/controller/auth_controller.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/images.dart';
import 'package:workout_tracker/utils/input.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  late AuthController controller;

  bool isPasswordVisible = false;

  @override
  void initState() {
    controller = DI.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: controller.passwordFormKey,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: controller.passwordValidator,
              textAlign: TextAlign.start,
              obscureText: !isPasswordVisible,
              decoration: customInputDecoration.copyWith(
                hintText: 'Password',
                hintStyle: const TextStyle(color: kPeppermint),
                contentPadding: EdgeInsets.only(
                    left: 12.w, right: 24.w, top: 16.h, bottom: 16.h),
              ),
              style: const TextStyle(color: kPeppermint),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: IconButton(
                onPressed: () => setState(() {
                  isPasswordVisible = !isPasswordVisible;
                }),
                splashRadius: 1.r,
                icon: getIcon(isPasswordVisible),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getIcon(bool isVisible) {
    return isVisible
        ? SvgPicture.asset(Images.showIcon, color: kAquaIsland)
        : SvgPicture.asset(Images.hideIcon, color: kAquaIsland);
  }
}
