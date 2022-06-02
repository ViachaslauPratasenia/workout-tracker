import 'package:flutter/material.dart';
import 'package:workout_tracker/pages/home/bottom_navigation/bottom_navigation.dart';
import 'package:workout_tracker/pages/home/bottom_navigation/bottom_navigation_item.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/ui_kit/conditional_content.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final BottomNavigationItem? activeNavigationItem;
  final Color backgroundColor;
  final double topPadding;

  const BaseScreen({
    Key? key,
    required this.child,
    this.appBar,
    this.activeNavigationItem,
    this.backgroundColor = kCello,
    this.topPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: Stack(
        children: [
          Positioned.fill(
            // top: topPadding,
            bottom: activeNavigationItem != null ? 48 : 0,
            child: child,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ConditionalContent(
              conditional: activeNavigationItem != null,
              truthyBuilder: () => BottomNavigation(
                activeItem: activeNavigationItem!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
