// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatDTO _$ChatDTOFromJson(Map<String, dynamic> json) => ChatDTO(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      doctorId: json['doctorId'] as int?,
    );

Map<String, dynamic> _$ChatDTOToJson(ChatDTO instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'doctorId': instance.doctorId,
    };
