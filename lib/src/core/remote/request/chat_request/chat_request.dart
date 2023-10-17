import 'package:json_annotation/json_annotation.dart';

part 'chat_request.g.dart';

//Send email, password to api
@JsonSerializable()
class ChatRequest {

  @JsonKey(name: 'userId')
  final int? userId;

  @JsonKey(name: 'doctorId')
  final int? doctorId;

  ChatRequest({
    this.userId,
    this.doctorId,
  });

  factory ChatRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRequestToJson(this);
}