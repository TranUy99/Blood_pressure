import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable()
class ScheduleDTO {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'time')
  final String? time;

 @JsonKey(name: 'workDate')
  final String? workDate;

   @JsonKey(name: 'doctorId')
  final int? doctorId;  

  @JsonKey(name: 'statusId')
  final int? statusId;

  ScheduleDTO({
    this.id,
    this.time,
    this.workDate,
    this.doctorId,
    this.statusId,
   
  });

  factory ScheduleDTO.fromJson(Map<String, dynamic> json) => _$ScheduleDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleDTOToJson(this);
}
