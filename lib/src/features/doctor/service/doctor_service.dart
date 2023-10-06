import 'dart:developer';

import 'package:blood_pressure/src/core/remote/response/doctor_response/doctor_response.dart';
import 'package:blood_pressure/src/core/remote/response/schedule_response.dart/schedule_response.dart';
import 'package:dio/dio.dart' as dio;
import '../../../api/api_service.dart';

class DoctorService {
  static Future<DoctorResponse> getDoctor() async {
    DoctorResponse getDoctor = await ApiService(dio.Dio()).getDoctor();
   
    return getDoctor;
  }

   static Future<ScheduleResponse> getSchedule(int? doctorId, String? workDate) async {
    ScheduleResponse getSchedule = await ApiService(dio.Dio()).getSchedule(doctorId: doctorId, workDate:workDate);
   
    return getSchedule;
  }
}
