import 'dart:developer';

import 'package:blood_pressure/src/core/remote/request/blood_request/blood_request.dart';
import 'package:blood_pressure/src/core/remote/request/booking_request/booking_request.dart';
import 'package:blood_pressure/src/core/remote/response/blood_response/blood_response.dart';
import 'package:blood_pressure/src/core/remote/response/doctor_response/doctor_response.dart';
import 'package:blood_pressure/src/core/remote/response/schedule_response.dart/schedule_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../core/model/user.dart';
import '../core/remote/request/login_request/login_request.dart';
import '../core/remote/request/register_request/sign_up_request.dart';
import '../core/remote/response/blood_response/get_blood_response.dart';
import '../core/remote/response/booking_response/create_booking_reponse.dart';
import '../core/remote/response/booking_response/get_booking_reponse.dart';
import '../core/remote/response/login_reponse/login_response.dart';
import '../core/remote/response/message_response/get_message_response.dart';
import '../core/remote/response/register_reponse/sign_up_response.dart';

part 'api_service.g.dart';

//Base address
@RestApi(baseUrl: 'http://192.168.1.14:8000')
// @RestApi(baseUrl: 'http://45.117.170.206:8085')

abstract class ApiService {
  factory ApiService(Dio dio) {
    dio.options = BaseOptions(
        validateStatus: (status) => true,
        sendTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
        connectTimeout: const Duration(milliseconds: 5000),
        receiveDataWhenStatusError: true,
        contentType: 'application/json',
        headers: {'Content-Type': 'application/json'});
    return _ApiService(dio);
  }

  //Call api getUser to get user information after login
  @GET('/api/user/{id}')
  Future<UserDTO> getUser(
      {@Header("Authorization") required String auth, @Path('id') required int id});

  //Verified email and password to login
  @POST('/api/login')
  Future<LoginResponse> login(@Body() LoginRequest login);

  @POST('/api/register')
  Future<SignUpResponse> register(@Body() SignUpRequest register);

  @POST('/api/blood-pressure/{id}')
  Future<BloodResponse> createBlood(
      {@Header("Authorization") required String? auth,
      @Path("id") required int? id,
      @Body() required BloodRequest createBlood});

  @GET('/api/blood-pressure/reverse/{id}')
  Future<GetBloodResponse> getBloodReverse({
    @Query('no') required int? no,
    @Query('limit') required int? limit,
    @Header("Authorization") required String? auth,
    @Path("id") required int? id,
  });

  @GET('/api/blood-pressure/user/{id}')
  Future<GetBloodResponse> getBlood({
    @Query('no') required int? no,
    @Query('limit') required int? limit,
    @Header("Authorization") required String? auth,
    @Path("id") required int? id,
  });

  @GET('/api/blood-pressure/{id}')
  Future<BloodResponse> getBloodById({
    @Path("id") required int? id,
  });

  @GET('/api/getDoctor')
  Future<DoctorResponse> getDoctor();

  @GET('/api/scheduleDoctorId/{id}')
  Future<ScheduleResponse> getSchedule({
    @Query('workDate') required String? workDate,
    @Path("id") required int? doctorId,
  });

//api booking
  @POST('/api/booking')
  Future<CreateBookingResponse> createBooking(@Body() BookingRequest createBooking);

  @GET('/api/booking/{id}')
  Future<GetBookingResponse> getBooking({
    @Header("Authorization") required String? auth,
    @Path("id") required int? id,
  });


//api message

  @GET('/api/getMessagesByChat')
  Future<GetMessageResponse> getMessage({
    @Query('chatId') required int? chatId,
  });

}
