import 'package:json_annotation/json_annotation.dart';

part 'blood_request.g.dart';

//Send email, password to api
@JsonSerializable()
class BloodRequest {
  BloodRequest({
    this.sys,
    this.dia,
    this.pulse,
    this.createDay,
  });

  @JsonKey(name: 'sys')
  final double? sys;

  @JsonKey(name: 'dia')
  final double? dia;
  
    @JsonKey(name: 'pulse')
  final double? pulse;
  
    @JsonKey(name: 'createDay')
  final String? createDay;

  factory BloodRequest.fromJson(Map<String, dynamic> json) =>
      _$BloodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BloodRequestToJson(this);
}