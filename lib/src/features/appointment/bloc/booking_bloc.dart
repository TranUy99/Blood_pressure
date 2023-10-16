// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:blood_pressure/src/features/appointment/bloc/booking_event.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/remote/response/booking_response/get_booking_reponse.dart';
import '../service/booking_service.dart';
import 'booking_state.dart';

class BookingBloc {
  final BehaviorSubject<BookingState> _bookingStateSubject = BehaviorSubject<BookingState>();

  Stream<BookingState> get bookingStateStream => _bookingStateSubject.stream;
  BookingService bookingService = BookingService();
  //Get event and call api Blood
  Future<void> createBooking(BookingEvent event) async {
    if (event is CreateBookingEvent) {
      final scheduleId = event.scheduleId;
      final createDay = event.createDay;

      try {
        final result = await bookingService.createBooking(scheduleId,createDay);
        if (result.errCode == 0) {
          _bookingStateSubject.sink.add(BookingSuccessState(result));
        } else {
          _bookingStateSubject.sink.add(BookingFailureState("error"));
        }
      } catch (e) {
        _bookingStateSubject.add(BookingFailureState("error"));
      }
    }
  }
  Future<void> getBooking(GetBookingEvent event) async {
    
    try {
        final GetBookingResponse getBookingResponse = await bookingService.getBooking();

      if (getBookingResponse.errCode == 0) {
        _bookingStateSubject.sink.add(GetBookingSuccessState(getBookingResponse));
      } else {
        _bookingStateSubject.sink.add(GetBookingFailureState("No  available"));
      }
    } catch (e) {
      _bookingStateSubject.sink.add(GetBookingFailureState("No  available1"));
    }
  }

  void dispose() {
    _bookingStateSubject.close();
  }
}
