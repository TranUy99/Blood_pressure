// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import '../../../model/message.dart';

part 'get_message_response.g.dart';

//Receive message, token, idUser, type, email, role from api
@JsonSerializable()
class GetMessageResponse {

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'errorCode')
  final int? errorCode;

  @JsonKey(name: 'messages')
  final List<MessageDTO>? messages;



  GetMessageResponse({
    this.message,
    this.errorCode,
    this.messages,
  });

  factory GetMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMessageResponseToJson(this);
}