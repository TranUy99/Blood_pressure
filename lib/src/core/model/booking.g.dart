// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDTO _$BookingDTOFromJson(Map<String, dynamic> json) => BookingDTO(
      id: json['id'] as int?,
      createDay: json['createDay'] as String?,
      schedule: json['schedule'] == null
          ? null
          : ScheduleDTO.fromJson(json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingDTOToJson(BookingDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createDay': instance.createDay,
      'schedule': instance.schedule,
    };
