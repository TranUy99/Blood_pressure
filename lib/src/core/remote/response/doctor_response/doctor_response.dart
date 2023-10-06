
import 'package:blood_pressure/src/core/model/doctor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_response.g.dart';

//Receive message, token, idUser, type, email, role from api
@JsonSerializable()
class DoctorResponse {

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'errCode')
  final int? errCode;

  @JsonKey(name: 'doctors')
  final List<DoctorDTO>? doctors;



  DoctorResponse({
    this.message,
    this.errCode,
    this.doctors,
  });

  factory DoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorResponseToJson(this);
}