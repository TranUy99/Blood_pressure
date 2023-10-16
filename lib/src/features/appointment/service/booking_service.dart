import 'dart:developer';

import 'package:blood_pressure/main.dart';
import 'package:blood_pressure/src/core/remote/request/booking_request/booking_request.dart';
import 'package:dio/dio.dart' as dio;

import '../../../api/api_service.dart';
import '../../../core/remote/response/booking_response/create_booking_reponse.dart';
import '../../../core/remote/response/booking_response/get_booking_reponse.dart';

class BookingService {
  Future<CreateBookingResponse> createBooking(int? scheduleId, String? createDay) async {
    CreateBookingResponse createBookingResponse =
        await ApiService(dio.Dio()).createBooking(BookingRequest(
      userId: getUser.idUser,
      scheduleId: scheduleId,
      createDay: createDay,
    ));

    return createBookingResponse;
  }

  Future<GetBookingResponse> getBooking() async {
    GetBookingResponse getBookingResponse = await ApiService(dio.Dio()).getBooking(
      id: getUser.idUser,
      auth: 'Bearer ${getUser.token}',
    );

    return getBookingResponse;
  }
}
