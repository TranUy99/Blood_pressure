import 'dart:async';
import 'dart:developer';

import '../../../core/remote/response/booking_response/create_booking_reponse.dart';
import '../../../core/remote/response/booking_response/get_booking_reponse.dart';
import '../bloc/booking_bloc.dart';
import '../bloc/booking_event.dart';
import '../bloc/booking_state.dart';

class BookingViewModel {
  final BookingBloc _bookingBloc = BookingBloc();

  Future<CreateBookingResponse> createBooking(int? scheduleId, String? createDay) async {
  
    final createBookingEvent = CreateBookingEvent(scheduleId: scheduleId, createDay: createDay);
    await _bookingBloc.createBooking(createBookingEvent);

    StreamSubscription<BookingState>? subscription;
    final completer = Completer<CreateBookingResponse>();

    subscription = _bookingBloc.bookingStateStream.listen(
      (state) {
        if (state is BookingSuccessState) {
          completer.complete(state.createBookingResponse);
          subscription?.cancel();
        } else if (state is BookingFailureState) {
          completer.completeError('Error fetching products');
          subscription?.cancel();
        }
      },
    );

    return completer.future;
  }


    Future<GetBookingResponse> getBooking() async {
    final getBookingEvent = GetBookingEvent();
    GetBookingResponse getBookingResponse;

    Completer<GetBookingResponse> completer = Completer<GetBookingResponse>();

    await _bookingBloc.getBooking(getBookingEvent);

    StreamSubscription<BookingState>? subscription;
    subscription = _bookingBloc.bookingStateStream.listen((state) {
      if (state is GetBookingSuccessState) {
        getBookingResponse = state.getBookingResponse;
        completer.complete(getBookingResponse);
        subscription!.cancel(); // Hủy lắng nghe sau khi nhận được danh sách sản phẩm
      } else if (state is GetBookingFailureState) {
        completer.completeError('${state.errorMessage}');
        subscription!.cancel();
      }
    });

    return completer.future;
  }

}
