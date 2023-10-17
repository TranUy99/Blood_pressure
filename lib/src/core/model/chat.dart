import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class ChatDTO {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'userId')
  final int? userId;

 @JsonKey(name: 'doctorId')
  final int? doctorId;


  ChatDTO({
    this.id,
    this.userId,
    this.doctorId,
   
  });

  factory ChatDTO.fromJson(Map<String, dynamic> json) => _$ChatDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ChatDTOToJson(this);
}
