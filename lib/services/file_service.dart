import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:workout_tracker/models/workout/basic_exercise.dart';
import 'package:workout_tracker/models/workout/workout.dart';

class FileService {
  static Future<List<Workout>> parseWorkoutListFile() async {
    var list =
        json.decode(await rootBundle.loadString('assets/training_list.json'));

    return List<Workout>.from(
      list.map((model) => Workout.fromJson(model)),
    );
  }

  static Future<List<BasicExercise>> parseBasicExercisesFile() async {
    var list =
        json.decode(await rootBundle.loadString('assets/exercises.json'));

    return List<BasicExercise>.from(
      list.map((model) => BasicExercise.fromJson(model)),
    );
  }
}
