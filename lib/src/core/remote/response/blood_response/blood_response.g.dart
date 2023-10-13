// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodResponse _$BloodResponseFromJson(Map<String, dynamic> json) =>
    BloodResponse(
      message: json['message'] as String?,
      errCode: json['errCode'] as int?,
      bloodPressure: json['bloodPressure'] == null
          ? null
          : BloodDTO.fromJson(json['bloodPressure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BloodResponseToJson(BloodResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errCode': instance.errCode,
      'bloodPressure': instance.bloodPressure,
    };
