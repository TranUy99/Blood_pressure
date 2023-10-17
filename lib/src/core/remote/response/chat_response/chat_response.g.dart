// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) => ChatResponse(
      errCode: json['errCode'] as int?,
      message: json['message'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$ChatResponseToJson(ChatResponse instance) =>
    <String, dynamic>{
      'errCode': instance.errCode,
      'message': instance.message,
      'id': instance.id,
    };
