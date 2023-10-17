// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessageResponse _$GetMessageResponseFromJson(Map<String, dynamic> json) =>
    GetMessageResponse(
      message: json['message'] as String?,
      errorCode: json['errorCode'] as int?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => MessageDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMessageResponseToJson(GetMessageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errorCode': instance.errorCode,
      'messages': instance.messages,
    };
