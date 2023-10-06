// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorResponse _$DoctorResponseFromJson(Map<String, dynamic> json) =>
    DoctorResponse(
      message: json['message'] as String?,
      errCode: json['errCode'] as int?,
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => DoctorDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorResponseToJson(DoctorResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errCode': instance.errCode,
      'doctors': instance.doctors,
    };
