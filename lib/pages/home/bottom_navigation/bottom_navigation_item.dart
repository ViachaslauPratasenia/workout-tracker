import 'package:flutter/material.dart';
import 'package:workout_tracker/models/categories.dart';
import 'package:workout_tracker/pages/categories/categories_screen.dart';
import 'package:workout_tracker/pages/home/home_screen.dart';
import 'package:workout_tracker/utils/images.dart';

enum BottomNavigationItem {
  workout,
  manual,
  progress,
  profile,
}

extension BottomNavigationItemExtension on BottomNavigationItem {
  Widget get screen {
    switch (this) {
      case BottomNavigationItem.workout:
        return const HomeScreen();
      case BottomNavigationItem.manual:
        return const CategoriesScreen(categoriesType: CategoriesType.exercises);
      case BottomNavigationItem.progress:
        return const HomeScreen();
      case BottomNavigationItem.profile:
        return const HomeScreen();
    }
  }

  String get image {
    switch (this) {
      case BottomNavigationItem.workout:
        return Images.exercisesIcon;
      case BottomNavigationItem.manual:
        return Images.manualIcon;
      case BottomNavigationItem.progress:
        return Images.progressIcon;
      case BottomNavigationItem.profile:
        return Images.profileIcon;
    }
  }
}
