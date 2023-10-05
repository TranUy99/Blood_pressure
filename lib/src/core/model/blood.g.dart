// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodDTO _$BloodDTOFromJson(Map<String, dynamic> json) => BloodDTO(
      id: json['id'] as int?,
      sys: json['sys'] as int?,
      dia: json['dia'] as int?,
      pulse: json['pulse'] as int?,
      createDay: json['createDay'] as String?,
    );

Map<String, dynamic> _$BloodDTOToJson(BloodDTO instance) => <String, dynamic>{
      'id': instance.id,
      'sys': instance.sys,
      'dia': instance.dia,
      'pulse': instance.pulse,
      'createDay': instance.createDay,
    };
