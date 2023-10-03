
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../core/model/user.dart';
import '../core/remote/request/login_request/login_request.dart';
import '../core/remote/request/register_request/sign_up_request.dart';
import '../core/remote/response/login_reponse/login_response.dart';
import '../core/remote/response/register_reponse/sign_up_response.dart';

part 'api_service.g.dart';

//Base address
@RestApi(baseUrl: 'http://192.168.1.23:8000/api')
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
  @GET('/user/{id}')
  Future<UserDTO> getUser(
      {@Header("Authorization") required String auth, @Path('id') required int id});

  //Verified email and password to login
  @POST('/login')
  Future<LoginResponse> login(@Body() LoginRequest login);

  // //Register new customer
  @POST('/register')
  Future<SignUpResponse> register(@Body() SignUpRequest register);
}
