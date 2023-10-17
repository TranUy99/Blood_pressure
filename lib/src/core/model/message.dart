import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class MessageDTO {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'chatId')
  final int? chatId;

 @JsonKey(name: 'content')
  final String? content;

   @JsonKey(name: 'senderType')
  final String? senderType;  



  MessageDTO({
    this.id,
    this.chatId,
    this.content,
    this.senderType,

  });

  factory MessageDTO.fromJson(Map<String, dynamic> json) => _$MessageDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDTOToJson(this);
}
