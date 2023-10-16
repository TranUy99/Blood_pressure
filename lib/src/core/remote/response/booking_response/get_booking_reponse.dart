import 'package:blood_pressure/src/core/model/booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_booking_reponse.g.dart';

//Receive user data from api
@JsonSerializable()
class GetBookingResponse {
  @JsonKey(name: 'errCode')
  final int? errCode;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'bookings')
  final List<BookingDTO>? bookings;

  GetBookingResponse({
    this.errCode,
    this.message,
    this.bookings
  });

  factory GetBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBookingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBookingResponseToJson(this);
}
