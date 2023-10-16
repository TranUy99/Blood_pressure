// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingRequest _$BookingRequestFromJson(Map<String, dynamic> json) =>
    BookingRequest(
      userId: json['userId'] as int?,
      scheduleId: json['scheduleId'] as int?,
      createDay: json['createDay'] as String?,
    );

Map<String, dynamic> _$BookingRequestToJson(BookingRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'scheduleId': instance.scheduleId,
      'createDay': instance.createDay,
    };
