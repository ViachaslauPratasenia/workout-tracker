import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_tracker/di/di.dart';
import 'package:workout_tracker/pages/auth/controller/auth_controller.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/images.dart';
import 'package:workout_tracker/utils/input.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  late AuthController controller;
  Widget? suffixIcon;

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
        key: controller.emailFormKey,
        child: TextFormField(
          onChanged: (text) {
            setState(() {
              suffixIcon = getSuffixIcon(controller);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: controller.emailValidator,
          textAlign: TextAlign.start,
          keyboardType: TextInputType.emailAddress,
          decoration: customInputDecoration.copyWith(
            hintText: 'Email',
            hintStyle: const TextStyle(color: kPeppermint),
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.only(
                left: 12.w, right: 24.w, top: 16.h, bottom: 16.h),
          ),
          style: const TextStyle(color: kPeppermint),
        ),
      ),
    );
  }

  Widget getSuffixIcon(AuthController controller) {
    return (controller.emailFormKey.currentState?.validate() == true)
        ? Padding(
            padding: EdgeInsets.all(10.w),
            child: SvgPicture.asset(
              Images.checkIcon,
            ),
          )
        : Padding(
            padding: EdgeInsets.all(10.w),
            child: SvgPicture.asset(Images.closeIcon),
          );
  }
}
