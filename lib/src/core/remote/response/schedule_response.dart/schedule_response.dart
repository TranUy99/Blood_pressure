
import 'package:json_annotation/json_annotation.dart';
import '../../../model/schedule.dart';
part 'schedule_response.g.dart';

//Receive message, token, idUser, type, email, role from api
@JsonSerializable()
class ScheduleResponse {

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'errCode')
  final int? errCode;

  @JsonKey(name: 'schedule')
  final List<ScheduleDTO>? schedule;



  ScheduleResponse({
    this.message,
    this.errCode,
    this.schedule,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleResponseToJson(this);
}