import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:workout_tracker/models/workout/workout_list.dart';

class FileService {
  static Future<void> parseTrainingListFile() async {
    var trainingList = WorkoutList.fromJson(json.decode(
      await rootBundle.loadString('assets/training_list.json'),
    ));

    print(trainingList);
  }
}
