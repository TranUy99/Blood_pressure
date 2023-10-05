import 'package:json_annotation/json_annotation.dart';

part 'blood.g.dart';

@JsonSerializable()
class BloodDTO {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'sys')
  final int? sys;

  @JsonKey(name: 'dia')
  final int? dia;

 @JsonKey(name: 'pulse')
  final int? pulse;

  @JsonKey(name: 'createDay')
  final String? createDay;
  BloodDTO({
  
    this.id,
    this.sys,
    this.dia,
    this.pulse,
    this.createDay
   
  });

  factory BloodDTO.fromJson(Map<String, dynamic> json) => _$BloodDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BloodDTOToJson(this);
}
