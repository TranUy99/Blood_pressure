// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blood_pressure/src/core/model/blood.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_blood_response.g.dart';

//Receive message, token, idUser, type, email, role from api
@JsonSerializable()
class GetBloodResponse {

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'errCode')
  final int? errCode;

  @JsonKey(name: 'bloodPressure')
  final List<BloodDTO>? bloodPressure;



  GetBloodResponse({
    this.message,
    this.errCode,
    this.bloodPressure,
  });

  factory GetBloodResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBloodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBloodResponseToJson(this);
}