import 'dart:async';

import 'package:blood_pressure/src/core/remote/response/message_response/get_message_response.dart';

import '../bloc/message_bloc.dart';
import '../bloc/message_event.dart';
import '../bloc/message_state.dart';


class MessageViewModel {
  final MessageBloc _messageBloc = MessageBloc();

  Future<GetMessageResponse> getMessage(int? chatId) async {
    final MessageEvent = GetMessageEvent(chatId: chatId);
    GetMessageResponse getMessageResponse;

    Completer<GetMessageResponse> completer = Completer<GetMessageResponse>();

    await _messageBloc.getMessage(MessageEvent);

    StreamSubscription<MessageState>? subscription;
    subscription = _messageBloc.messageStateStream.listen((state) {
      if (state is GetMessageSuccessState) {
        getMessageResponse = state.getMessageResponse;
        completer.complete(getMessageResponse);
        subscription!.cancel();
      } else if (state is GetMessageFailedState) {
        completer.completeError('${state.errorMessage}');
        subscription!.cancel();
      }
    });

    return completer.future;
  }


}
