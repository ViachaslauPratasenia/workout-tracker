import 'package:workout_tracker/models/category.dart';
import 'package:workout_tracker/models/workout/exercise.dart';
import 'package:workout_tracker/utils/images.dart';

enum CategoriesType { categories, exercises }

enum MainCategories {
  upperBody,
  lowerBody,
  cardio,
}

List<Category> getMainCategories() {
  return [
    Category(title: 'Готовая тренировка', imagePath: Images.workoutPlanIcon),
    Category(title: 'Список Упражнений', imagePath: Images.exercisesIcon),
  ];
}

List<Category> getExerciseCategories() {
  return [
    Category(title: 'Верх', imagePath: Images.upperBodyIcon),
    Category(title: 'Низ', imagePath: Images.lowerBodyIcon),
    Category(title: 'Кардио', imagePath: Images.cardioIcon),
  ];
}

Map<int, String> workoutIconsMap = {
  1: Images.dumbbellsIcon,
  2: Images.gymIcon,
  3: Images.pullBarsIcon,
};
