import 'dart:async';

import 'package:get/get.dart';
import 'package:workout_tracker/di/di.dart';
import 'package:workout_tracker/pages/home/home_screen.dart';
import 'package:workout_tracker/services/file_service.dart';
import 'package:workout_tracker/storage/basic_exercises_storage.dart';
import 'package:workout_tracker/storage/workouts_storage.dart';

class SplashController extends GetxController {
  var needShowInfo = Rx<bool>(false);

  late BasicExerciseStorage basicExerciseStorage;
  late WorkoutsStorage workoutsStorage;

  @override
  void onInit() {
    basicExerciseStorage = DI.find<BasicExerciseStorage>();
    workoutsStorage = DI.find<WorkoutsStorage>();

    Timer(const Duration(seconds: 2), () async {
      needShowInfo.value = true;

      _loadTrainings().then((value) {
        if (needShowInfo.isFalse) {
          Get.off(() => const HomeScreen());
        }
      });
    });
    super.onInit();
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
