// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_blood_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBloodResponse _$GetBloodResponseFromJson(Map<String, dynamic> json) =>
    GetBloodResponse(
      message: json['message'] as String?,
      errCode: json['errCode'] as int?,
      bloodPressure: (json['bloodPressure'] as List<dynamic>?)
          ?.map((e) => BloodDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBloodResponseToJson(GetBloodResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errCode': instance.errCode,
      'bloodPressure': instance.bloodPressure,
    };
