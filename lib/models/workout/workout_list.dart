import 'package:json_annotation/json_annotation.dart';
import 'package:workout_tracker/models/workout/workout_training.dart';

part 'workout_list.g.dart';

@JsonSerializable()
class WorkoutList {
  final List<WorkoutTraining> trainingList;

  WorkoutList({
    this.trainingList = const [],
  });

  factory WorkoutList.fromJson(Map<String, dynamic> json) => _$WorkoutListFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutListToJson(this);
}
