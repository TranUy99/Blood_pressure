import 'dart:developer';

import 'package:blood_pressure/main.dart';
import 'package:dio/dio.dart' as dio;

import '../../../api/api_service.dart';
import '../../../core/remote/request/blood_request/blood_request.dart';
import '../../../core/remote/response/blood_response/blood_response.dart';
import '../../../core/remote/response/blood_response/get_blood_response.dart';

class BloodService {
  static Future<BloodResponse> createBloodService(
      double? sys, double? dia, double? pulse, String? createDay) async {
    BloodResponse createBloodService = await ApiService(dio.Dio()).createBlood(
      auth: 'Bearer ${getUser.token}',
      id: getUser.idUser,
      createBlood: BloodRequest(
        sys: sys,
        dia: dia,
        pulse: pulse,
        createDay: createDay,
      ),
    );

    return createBloodService;
  }

  static Future<GetBloodResponse> getBlood() async {
    GetBloodResponse getBlood = await ApiService(dio.Dio()).getBlood(
      auth: 'Bearer ${getUser.token}',
      id: getUser.idUser,
      no: 0,
      limit: 20,
    );

    return getBlood;
  }

  static Future<GetBloodResponse> getBloodReverse() async {
    GetBloodResponse getBloodReverse = await ApiService(dio.Dio()).getBloodReverse(
      auth: 'Bearer ${getUser.token}',
      id: getUser.idUser,
      no: 0,
      limit: 20,
    );

    return getBloodReverse;
  }
}
