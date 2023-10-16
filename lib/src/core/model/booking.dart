// ignore_for_file: non_constant_identifier_names

import 'package:blood_pressure/src/core/model/schedule.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

@JsonSerializable()
class BookingDTO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'createDay')
  final String? createDay;
  @JsonKey(name: 'schedule')
  final ScheduleDTO? schedule;
  BookingDTO({this.id, this.createDay, this.schedule});

  factory BookingDTO.fromJson(Map<String, dynamic> json) => _$BookingDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDTOToJson(this);
}
