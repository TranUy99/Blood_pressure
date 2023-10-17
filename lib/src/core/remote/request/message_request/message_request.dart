import 'package:json_annotation/json_annotation.dart';

part 'message_request.g.dart';

//Send email, password to api
@JsonSerializable()
class MessageRequest {

  @JsonKey(name: 'chatId')
  final int? chatId;

  @JsonKey(name: 'content')
  final String? content;

  @JsonKey(name: 'senderType')
  final String? senderType;

  MessageRequest({
    this.chatId,
    this.content,
    this.senderType
  });

  factory MessageRequest.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MessageRequestToJson(this);
}