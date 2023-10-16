import 'package:json_annotation/json_annotation.dart';

part 'booking_request.g.dart';

//Send email, password, fullname to api
@JsonSerializable()
class BookingRequest {
  BookingRequest({
    this.userId,
    this.scheduleId,
    this.createDay,
  });

  @JsonKey(name: 'userId')
  final int? userId;

  @JsonKey(name: 'scheduleId')
  final int? scheduleId;

  @JsonKey(name: 'createDay')
  final String? createDay;

  factory BookingRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BookingRequestToJson(this);
}