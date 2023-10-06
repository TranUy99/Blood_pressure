// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleDTO _$ScheduleDTOFromJson(Map<String, dynamic> json) => ScheduleDTO(
      id: json['id'] as int?,
      time: json['time'] as String?,
      workDate: json['workDate'] as String?,
      doctorId: json['doctorId'] as int?,
      statusId: json['statusId'] as int?,
    );

Map<String, dynamic> _$ScheduleDTOToJson(ScheduleDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'workDate': instance.workDate,
      'doctorId': instance.doctorId,
      'statusId': instance.statusId,
    };
