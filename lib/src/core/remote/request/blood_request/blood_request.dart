// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'blood_request.g.dart';
//Send email, password to api
@JsonSerializable()
class BloodRequest {
  BloodRequest({
   
    this.SystolicPressure,
    this.DiastolicPressure,
    this.PulsePressure,
    this.HeartRate,
    this.BodyTemperature,
     this.createDay,
  });

  @JsonKey(name: 'SystolicPressure')
  final double? SystolicPressure;

  @JsonKey(name: 'DiastolicPressure')
  final double? DiastolicPressure;
  
  @JsonKey(name: 'PulsePressure')
  final double? PulsePressure;

   @JsonKey(name: 'HeartRate')
  final double? HeartRate;

  @JsonKey(name: 'BodyTemperature')

  final double? BodyTemperature;
  
  @JsonKey(name: 'createDay')
  final String? createDay;

  factory BloodRequest.fromJson(Map<String, dynamic> json) =>
      _$BloodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BloodRequestToJson(this);
}