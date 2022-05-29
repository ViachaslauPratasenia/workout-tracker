import 'package:workout_tracker/models/workout/day.dart';
import 'package:workout_tracker/storage/workouts_storage.dart';

class WorkoutHelper {
  WorkoutsStorage _workoutsStorage;

  WorkoutHelper(this._workoutsStorage);
}

class WorkoutWithExercises {
  final int? id;
  final String title;
  final List<Day> days;
  final String? description;
  final int level;

  WorkoutWithExercises(
    this.id,
    this.title,
    this.days,
    this.description,
    this.level,
  );
}
