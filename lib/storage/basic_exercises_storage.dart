import 'package:hive/hive.dart';
import 'package:workout_tracker/models/categories.dart';
import 'package:workout_tracker/models/workout/basic_exercise.dart';

class BasicExerciseStorage {
  final _store = Hive.box<BasicExercise>("basic_exercises");

  storeExercise(BasicExercise exercise) {
    putOrUpdate(exercise);
  }

  removeExercise(BasicExercise exercise) {
    if (getAllExercisesList().contains(exercise)) {
      _store.deleteAt(getAllExercisesList().indexOf(exercise));
    }
  }

  List<BasicExercise> getAllExercisesList() {
    var values = _store.values.toList();
    values.sort((exercise1, exercise2) {
      return exercise1.type.compareTo(exercise2.type);
    });
    return values;
  }

  BasicExercise getExerciseById(int id) {
    return getAllExercisesList().firstWhere((exercise) {
      return exercise.id == id;
    });
  }

  List<BasicExercise> getExerciseListByType(MainCategories type) {
    return getAllExercisesList().where((exercise) {
      return exercise.type == type.name;
    }).toList();
  }

  storeAllExercises(List<BasicExercise> exercisesList) {
    List<BasicExercise> oldExercisesList = getAllExercisesList();

    if (exercisesList.isEmpty) {
      for (var exercise in oldExercisesList) {
        removeExercise(exercise);
      }

      return;
    }

    for (var exercise in oldExercisesList) {
      if (!exercisesList.contains(exercise)) {
        try {
          exercisesList.where((element) => element.name == exercise.name);

          removeExercise(exercise);
        } catch (exception) {
          removeExercise(exercise);
        }
      }
    }

    for (var exercise in exercisesList) {
      storeExercise(exercise);
    }
  }

  Future<void> putOrUpdate(BasicExercise exercise) {
    var indexOfExercise = -1;

    for (int index = 0; index < _store.values.length; index++) {
      if (_store.getAt(index)?.id == exercise.id) {
        indexOfExercise = index;
        break;
      }
    }

    if (indexOfExercise == -1) {
      return _store.add(exercise);
    } else {
      return _store.putAt(indexOfExercise, exercise);
    }
  }
}
