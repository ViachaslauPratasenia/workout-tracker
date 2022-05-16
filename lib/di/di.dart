import 'package:get/get.dart';
import 'package:workout_tracker/storage/basic_exercises_storage.dart';
import 'package:workout_tracker/storage/workouts_storage.dart';

class DI {
  static initializeInstances() {
    Get.put(BasicExerciseStorage());
    Get.put(WorkoutsStorage());
  }

  static T put<T>(T obj) {
    return Get.put<T>(obj);
  }

  static T find<T>() {
    return Get.find<T>();
  }

  DI._();
}
