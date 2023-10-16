// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_booking_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBookingResponse _$CreateBookingResponseFromJson(
        Map<String, dynamic> json) =>
    CreateBookingResponse(
      errCode: json['errCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateBookingResponseToJson(
        CreateBookingResponse instance) =>
    <String, dynamic>{
      'errCode': instance.errCode,
      'message': instance.message,
    };
