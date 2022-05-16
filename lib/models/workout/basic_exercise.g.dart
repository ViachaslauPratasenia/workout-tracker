// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_exercise.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BasicExerciseAdapter extends TypeAdapter<BasicExercise> {
  @override
  final int typeId = 0;

  @override
  BasicExercise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BasicExercise(
      id: fields[0] as int,
      name: fields[1] as String,
      type: fields[2] as String,
      description: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BasicExercise obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasicExerciseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicExercise _$BasicExerciseFromJson(Map<String, dynamic> json) =>
    BasicExercise(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$BasicExerciseToJson(BasicExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
    };
