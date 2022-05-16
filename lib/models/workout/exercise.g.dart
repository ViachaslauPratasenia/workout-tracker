// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseAdapter extends TypeAdapter<Exercise> {
  @override
  final int typeId = 2;

  @override
  Exercise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Exercise(
      basicExerciseId: fields[0] as int,
      sets: fields[1] as int,
      setsRelaxInSeconds: fields[2] as int?,
      repeatCount: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Exercise obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.basicExerciseId)
      ..writeByte(1)
      ..write(obj.sets)
      ..writeByte(2)
      ..write(obj.setsRelaxInSeconds)
      ..writeByte(3)
      ..write(obj.repeatCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      basicExerciseId: json['exerciseId'] as int,
      sets: json['sets'] as int? ?? 1,
      setsRelaxInSeconds: json['setsRelaxInSeconds'] as int?,
      repeatCount: json['repeatCount'] as int?,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'exerciseId': instance.basicExerciseId,
      'sets': instance.sets,
      'setsRelaxInSeconds': instance.setsRelaxInSeconds,
      'repeatCount': instance.repeatCount,
    };
