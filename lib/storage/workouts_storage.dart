import 'package:hive/hive.dart';
import 'package:workout_tracker/models/workout/basic_exercise.dart';
import 'package:workout_tracker/models/workout/workout.dart';

class WorkoutsStorage {
  final _store = Hive.box<Workout>("workouts");

  storeWorkout(Workout workout) {
    putOrUpdate(workout);
  }

  removeWorkout(Workout workout) {
    if (getAllWorkoutsList().contains(workout)) {
      _store.deleteAt(getAllWorkoutsList().indexOf(workout));
    }
  }

  List<Workout> getAllWorkoutsList() {
    var values = _store.values.toList();
    values.sort((workout1, workout2) {
      return workout1.title.compareTo(workout2.title);
    });
    return values;
  }

  Workout getWorkoutById(int id) {
    return getAllWorkoutsList().firstWhere((workout) {
      return workout.id == id;
    });
  }

  storeAllWorkouts(List<Workout> workoutList) {
    List<Workout> oldWorkoutList = getAllWorkoutsList();

    if (workoutList.isEmpty) {
      for (var workout in oldWorkoutList) {
        removeWorkout(workout);
      }

      return;
    }

    for (var workout in oldWorkoutList) {
      if (!workoutList.contains(workout)) {
        try {
          workoutList.where((element) => element.title == workout.title);

          removeWorkout(workout);
        } catch (exception) {
          removeWorkout(workout);
        }
      }
    }

    for (var workout in workoutList) {
      storeWorkout(workout);
    }
  }

  Future<void> putOrUpdate(Workout workout) {
    var indexOfWorkout = -1;

    for (int index = 0; index < _store.values.length; index++) {
      if (_store.getAt(index)?.id == workout.id) {
        indexOfWorkout = index;
        break;
      }
    }

    if (indexOfWorkout == -1) {
      return _store.add(workout);
    } else {
      return _store.putAt(indexOfWorkout, workout);
    }
  }
}
