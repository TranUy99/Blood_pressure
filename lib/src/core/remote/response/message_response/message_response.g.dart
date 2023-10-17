// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      message: json['message'] as String?,
      errCode: json['errCode'] as int?,
      content: json['content'] == null
          ? null
          : MessageDTO.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errCode': instance.errCode,
      'content': instance.content,
    };
