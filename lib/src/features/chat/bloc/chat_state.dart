import '../../../core/remote/response/chat_response/chat_response.dart';

abstract class ChatState {}

class ChatLoadedState extends ChatState {
  
  final ChatResponse getChatResponse;
  ChatLoadedState(this.getChatResponse);
}

class ChatErrorState extends ChatState {
  final String errorMessage;
  ChatErrorState(this.errorMessage);
}

