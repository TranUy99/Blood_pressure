



import '../../../core/remote/response/message_response/get_message_response.dart';

abstract class MessageState {}

class GetMessageSuccessState extends MessageState {
  
  final GetMessageResponse getMessageResponse;
  GetMessageSuccessState(this.getMessageResponse);
}

class GetMessageFailedState extends MessageState {
  final String errorMessage;
  GetMessageFailedState(this.errorMessage);
}

