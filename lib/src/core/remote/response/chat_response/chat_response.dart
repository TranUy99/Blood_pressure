// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'chat_response.g.dart';

//Receive message, token, idUser, type, email, role from api
@JsonSerializable()
class ChatResponse {

  @JsonKey(name: 'errCode')
  final int? errCode;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'id')
  final int? id;

  ChatResponse({this.errCode, this.message, this.id});

  factory ChatResponse.fromJson(Map<String, dynamic> json) => _$ChatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}
