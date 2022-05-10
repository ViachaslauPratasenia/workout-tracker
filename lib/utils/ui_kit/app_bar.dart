import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/utils/colors.dart';

enum CustomAppBarVariants { primary, secondary }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  late final Size preferredSize;

  final CustomAppBarVariants variant;
  final String? titleStr;
  final Widget? leading;
  final Widget? title;
  final List<Widget> actions;
  final bool hasBorderLine;

  CustomAppBar({
    Key? key,
    this.variant = CustomAppBarVariants.primary,
    this.titleStr,
    this.leading,
    this.title,
    this.actions = const [],
    this.hasBorderLine = true,
  }) : super(key: key) {
    preferredSize = Size.fromHeight(50.h);
  }

  Color get backgroundColor => variant == CustomAppBarVariants.secondary
      ? Colors.white
      : Colors.transparent;

  void Function() _onBack(BuildContext context) => () => Get.back();

  @override
  Widget build(BuildContext context) {
    final canBack = Navigator.canPop(context);

    Widget? leadingWidget = leading;
    leadingWidget ??= canBack
        ? IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            splashRadius: 20.w,
            onPressed: _onBack(context),
          )
        : const SizedBox.shrink();

    Widget? titleWidget = title;
    titleWidget ??= Text(
      titleStr ?? '',
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: kTextColor,
        letterSpacing: 2,
      ),
    );

    return AppBar(
      title: titleWidget,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: leadingWidget,
      actions: actions,
      bottom: hasBorderLine
          ? PreferredSize(
              child: Container(
                color: kTextColor.withOpacity(0.2),
                height: 1.0,
              ),
              preferredSize: const Size.fromHeight(4.0),
            )
          : null,
    );
  }
}
