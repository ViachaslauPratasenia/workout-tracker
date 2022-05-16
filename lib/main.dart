import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:workout_tracker/models/workout/basic_exercise.dart';
import 'package:workout_tracker/models/workout/day.dart';
import 'package:workout_tracker/models/workout/exercise.dart';
import 'package:workout_tracker/models/workout/workout.dart';
import 'package:workout_tracker/pages/home/home_screen.dart';
import 'package:path_provider/path_provider.dart' as part_provider;
import 'package:workout_tracker/pages/splash/splash_screen.dart';

import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await part_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(BasicExerciseAdapter());
  Hive.registerAdapter(DayAdapter());
  Hive.registerAdapter(ExerciseAdapter());
  Hive.registerAdapter(WorkoutAdapter());

  await Hive.openBox<BasicExercise>("basic_exercises");
  await Hive.openBox<Workout>("workouts");

  DI.initializeInstances();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (child) => GetMaterialApp(
        title: 'Workout tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
