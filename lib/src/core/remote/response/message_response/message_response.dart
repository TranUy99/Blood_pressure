// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import '../../../model/message.dart';

part 'message_response.g.dart';

//Receive message, token, idUser, type, email, role from api
@JsonSerializable()
class MessageResponse {

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'errCode')
  final int? errCode;

  @JsonKey(name: 'content')
  final MessageDTO? content;



  MessageResponse({
    this.message,
    this.errCode,
    this.content,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}