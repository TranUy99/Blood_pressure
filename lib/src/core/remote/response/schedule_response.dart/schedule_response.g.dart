// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleResponse _$ScheduleResponseFromJson(Map<String, dynamic> json) =>
    ScheduleResponse(
      message: json['message'] as String?,
      errCode: json['errCode'] as int?,
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => ScheduleDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleResponseToJson(ScheduleResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errCode': instance.errCode,
      'schedule': instance.schedule,
    };
