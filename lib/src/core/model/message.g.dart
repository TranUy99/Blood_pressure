// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDTO _$MessageDTOFromJson(Map<String, dynamic> json) => MessageDTO(
      id: json['id'] as int?,
      chatId: json['chatId'] as int?,
      content: json['content'] as String?,
      senderType: json['senderType'] as String?,
    );

Map<String, dynamic> _$MessageDTOToJson(MessageDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatId': instance.chatId,
      'content': instance.content,
      'senderType': instance.senderType,
    };
