import 'dart:developer';

import 'package:rxdart/rxdart.dart';

import '../../../core/remote/response/message_response/get_message_response.dart';
import '../service/chat_service.dart';
import 'message_event.dart';
import 'message_state.dart';

class MessageBloc {
  final BehaviorSubject<MessageState> _messageStateSubject = BehaviorSubject<MessageState>();

  Stream<MessageState> get messageStateStream => _messageStateSubject.stream;

  MessageService messageService = MessageService();

  Future<void> getMessage(GetMessageEvent event) async {
    try {
      final GetMessageResponse getMessage = await messageService.getMessage(event.chatId);
      
      if (getMessage.errorCode == 0) {
        _messageStateSubject.sink.add(GetMessageSuccessState(getMessage));
      } else {
        _messageStateSubject.sink.add(GetMessageFailedState("${getMessage.message}"));
      }
    } catch (e) {
      _messageStateSubject.sink.add(GetMessageFailedState("No available"));
    }
  }

  void dispose() {
    _messageStateSubject.close();
  }
}
