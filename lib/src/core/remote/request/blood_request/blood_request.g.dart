// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodRequest _$BloodRequestFromJson(Map<String, dynamic> json) => BloodRequest(
      SystolicPressure: (json['SystolicPressure'] as num?)?.toDouble(),
      DiastolicPressure: (json['DiastolicPressure'] as num?)?.toDouble(),
      PulsePressure: (json['PulsePressure'] as num?)?.toDouble(),
      HeartRate: (json['HeartRate'] as num?)?.toDouble(),
      BodyTemperature: (json['BodyTemperature'] as num?)?.toDouble(),
      createDay: json['createDay'] as String?,
    );

Map<String, dynamic> _$BloodRequestToJson(BloodRequest instance) =>
    <String, dynamic>{
      'SystolicPressure': instance.SystolicPressure,
      'DiastolicPressure': instance.DiastolicPressure,
      'PulsePressure': instance.PulsePressure,
      'HeartRate': instance.HeartRate,
      'BodyTemperature': instance.BodyTemperature,
      'createDay': instance.createDay,
    };
