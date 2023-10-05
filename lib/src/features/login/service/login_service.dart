import 'dart:developer';

import 'package:dio/dio.dart' as dio;

import '../../../api/api_service.dart';
import '../../../core/model/user.dart';
import '../../../core/remote/request/login_request/login_request.dart';
import '../../../core/remote/response/login_reponse/login_response.dart';

class LoginService {
  //Call api login
  static Future<LoginResponse> loginService(String? email, String? password) async {
   
    LoginResponse loginResponse = await ApiService(dio.Dio()).login(LoginRequest(
      email: email,
      password: password,
    ));

    return loginResponse;
  }
}

class UserService {
  //Call api getUser
  static Future<UserDTO> userService(int id, String token) async {
    UserDTO userDTO = await ApiService(dio.Dio()).getUser(id: id, auth: 'Bearer $token');
    
    return userDTO;
  }
}
