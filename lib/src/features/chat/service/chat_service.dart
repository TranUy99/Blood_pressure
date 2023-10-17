import 'dart:developer';

import 'package:blood_pressure/src/core/remote/response/message_response/get_message_response.dart';
import 'package:dio/dio.dart' as dio;
import '../../../api/api_service.dart';

class MessageService {
  Future<GetMessageResponse> getMessage(int? chatId) async {
    GetMessageResponse getDoctor = await ApiService(dio.Dio()).getMessage(chatId: chatId);
   
    return getDoctor;
  }
}
