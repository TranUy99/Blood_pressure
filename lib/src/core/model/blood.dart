// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'blood.g.dart';

@JsonSerializable()
class BloodDTO {
  @JsonKey(name: 'id')
  final int? id;

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

  @JsonKey(name: 'Disease')
  final String? Disease;
  @JsonKey(name: 'createDay')
  final String? createDay;
  BloodDTO({
  
    this.id,
    this.SystolicPressure,
    this.DiastolicPressure,
    this.PulsePressure,
    this.HeartRate,
    this.BodyTemperature,
    this.Disease,
    this.createDay
   
  });

  factory BloodDTO.fromJson(Map<String, dynamic> json) => _$BloodDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BloodDTOToJson(this);
}
