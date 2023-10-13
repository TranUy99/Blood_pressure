// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodDTO _$BloodDTOFromJson(Map<String, dynamic> json) => BloodDTO(
      id: json['id'] as int?,
      SystolicPressure: (json['SystolicPressure'] as num?)?.toDouble(),
      DiastolicPressure: (json['DiastolicPressure'] as num?)?.toDouble(),
      PulsePressure: (json['PulsePressure'] as num?)?.toDouble(),
      HeartRate: (json['HeartRate'] as num?)?.toDouble(),
      BodyTemperature: (json['BodyTemperature'] as num?)?.toDouble(),
      Disease: json['Disease'] as String?,
      createDay: json['createDay'] as String?,
    );

Map<String, dynamic> _$BloodDTOToJson(BloodDTO instance) => <String, dynamic>{
      'id': instance.id,
      'SystolicPressure': instance.SystolicPressure,
      'DiastolicPressure': instance.DiastolicPressure,
      'PulsePressure': instance.PulsePressure,
      'HeartRate': instance.HeartRate,
      'BodyTemperature': instance.BodyTemperature,
      'Disease': instance.Disease,
      'createDay': instance.createDay,
    };
