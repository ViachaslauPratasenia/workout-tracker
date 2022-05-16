import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/di/di.dart';
import 'package:workout_tracker/pages/home/home_screen.dart';
import 'package:workout_tracker/services/file_service.dart';
import 'package:workout_tracker/storage/basic_exercises_storage.dart';
import 'package:workout_tracker/storage/workouts_storage.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late BasicExerciseStorage basicExerciseStorage;
  late WorkoutsStorage workoutsStorage;

  @override
  void initState() {
    basicExerciseStorage = DI.find<BasicExerciseStorage>();
    workoutsStorage = DI.find<WorkoutsStorage>();
    super.initState();

    goToHomeAfterDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Images.calendarIcon,
              width: ScreenUtil.defaultSize.width * 0.6,
              height: ScreenUtil.defaultSize.width * 0.6,
              color: Colors.white,
            ),
            const SizedBox(
              height: 48,
            ),
            Text(
              'Workout Tracker',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: kTextColor,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToHomeAfterDelay() async {
    Timer(const Duration(seconds: 2), () async {
      _loadTrainings().then((value) {
        Get.off(() => const HomeScreen());
      });
    });
  }

  Future<void> _loadTrainings() async {
    await FileService.parseWorkoutListFile().then(
      (value) => workoutsStorage.storeAllWorkouts(value),
    );

    await FileService.parseBasicExercisesFile().then(
      (value) => basicExerciseStorage.storeAllExercises(value),
    );
  }
}
