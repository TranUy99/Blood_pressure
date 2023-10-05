// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodRequest _$BloodRequestFromJson(Map<String, dynamic> json) => BloodRequest(
      sys: (json['sys'] as num?)?.toDouble(),
      dia: (json['dia'] as num?)?.toDouble(),
      pulse: (json['pulse'] as num?)?.toDouble(),
      createDay: json['createDay'] as String?,
    );

Map<String, dynamic> _$BloodRequestToJson(BloodRequest instance) =>
    <String, dynamic>{
      'sys': instance.sys,
      'dia': instance.dia,
      'pulse': instance.pulse,
      'createDay': instance.createDay,
    };
