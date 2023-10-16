import 'package:json_annotation/json_annotation.dart';

part 'create_booking_reponse.g.dart';

//Receive user data from api
@JsonSerializable()


class CreateBookingResponse {
  @JsonKey(name: 'errCode')
  final int? errCode;
  @JsonKey(name: 'message')
  final String? message;



  CreateBookingResponse({
    this.errCode,
    this.message,
   
  });

  factory CreateBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBookingResponseToJson(this);
}