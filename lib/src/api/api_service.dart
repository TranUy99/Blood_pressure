import 'dart:developer';

import 'package:blood_pressure/src/core/remote/request/blood_request/blood_request.dart';
import 'package:blood_pressure/src/core/remote/response/blood_response/blood_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../core/model/user.dart';
import '../core/remote/request/login_request/login_request.dart';
import '../core/remote/request/register_request/sign_up_request.dart';
import '../core/remote/response/blood_response/get_blood_response.dart';
import '../core/remote/response/login_reponse/login_response.dart';
import '../core/remote/response/register_reponse/sign_up_response.dart';

part 'api_service.g.dart';

//Base address
@RestApi(baseUrl: 'http://192.168.1.11:8000')
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

  @GET('/api/blood-pressure/{id}')
  Future<GetBloodResponse> getBlood({
    @Query('no') required int? no,
    @Query('limit') required int? limit,
    @Header("Authorization") required String? auth,
    @Path("id") required int? id,
  });
}
