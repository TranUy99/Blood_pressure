// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageRequest _$MessageRequestFromJson(Map<String, dynamic> json) =>
    MessageRequest(
      chatId: json['chatId'] as int?,
      content: json['content'] as String?,
      senderType: json['senderType'] as String?,
    );

Map<String, dynamic> _$MessageRequestToJson(MessageRequest instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'content': instance.content,
      'senderType': instance.senderType,
    };
