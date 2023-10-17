import 'package:json_annotation/json_annotation.dart';
import 'package:blood_pressure/src/core/model/doctor.dart';
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

  @JsonKey(name: 'doctor')
  final DoctorDTO? doctor;

  ScheduleDTO({this.id, this.time, this.workDate, this.doctorId, this.statusId, this.doctor});

  factory ScheduleDTO.fromJson(Map<String, dynamic> json) => _$ScheduleDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleDTOToJson(this);
}
