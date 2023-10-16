// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_booking_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookingResponse _$GetBookingResponseFromJson(Map<String, dynamic> json) =>
    GetBookingResponse(
      errCode: json['errCode'] as int?,
      message: json['message'] as String?,
      bookings: (json['bookings'] as List<dynamic>?)
          ?.map((e) => BookingDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBookingResponseToJson(GetBookingResponse instance) =>
    <String, dynamic>{
      'errCode': instance.errCode,
      'message': instance.message,
      'bookings': instance.bookings,
    };
