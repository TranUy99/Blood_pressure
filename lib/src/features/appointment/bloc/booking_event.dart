// ignore_for_file: non_constant_identifier_names

abstract class BookingEvent {}

//Create sign up event
class CreateBookingEvent extends BookingEvent {
  final int? scheduleId;
  final String? createDay;

  CreateBookingEvent({required this.scheduleId, required this.createDay});
}

class GetBookingEvent extends BookingEvent {}
