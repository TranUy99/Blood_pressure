// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

//Receive message, token, idUser, type, email, role from api
@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'token')
  final String? token;

  @JsonKey(name: 'idUser')
  final int? idUser;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'errCode')
  final int? errCode;

 

  LoginResponse({
    this.message,
    this.token,
    this.errCode,
    this.idUser,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}