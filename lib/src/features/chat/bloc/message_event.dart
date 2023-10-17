abstract class DoctorEvent {}


class GetMessageEvent extends DoctorEvent {
  final int? chatId;

  GetMessageEvent({
    required this.chatId,
   
  });
}
