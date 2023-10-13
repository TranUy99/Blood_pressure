// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:blood_pressure/main.dart';
import 'package:dio/dio.dart' as dio;

import '../../../api/api_service.dart';
import '../../../core/remote/request/blood_request/blood_request.dart';
import '../../../core/remote/response/blood_response/blood_response.dart';
import '../../../core/remote/response/blood_response/get_blood_response.dart';

class BloodService {
  static Future<BloodResponse> createBloodService(
      double? SystolicPressure,
      double? DiastolicPressure,
      double? PulsePressure,
      double? HeartRate,
      double? BodyTemperature,
      String? createDay) async {
    BloodResponse createBloodService = await ApiService(dio.Dio()).createBlood(
      auth: 'Bearer ${getUser.token}',
      id: getUser.idUser,
      createBlood: BloodRequest(
        SystolicPressure: SystolicPressure,
        DiastolicPressure: DiastolicPressure,
        PulsePressure: PulsePressure,
        HeartRate: HeartRate,
        BodyTemperature: BodyTemperature,
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

  static Future<BloodResponse> getBloodById(int? id) async {
 
    BloodResponse getBloodReverse = await ApiService(dio.Dio()).getBloodById(
      id: id,
    );

    return getBloodReverse;
  }
}
