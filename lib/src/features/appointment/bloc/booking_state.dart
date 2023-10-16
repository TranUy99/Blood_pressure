



import '../../../core/remote/response/booking_response/create_booking_reponse.dart';
import '../../../core/remote/response/booking_response/get_booking_reponse.dart';

abstract class BookingState  {}

class InitialBookingState  extends BookingState  {
  // Trạng thái khởi tạo
}

//State for login success
class BookingSuccessState  extends BookingState  {
 final CreateBookingResponse createBookingResponse;
  BookingSuccessState (this.createBookingResponse);
}

//State for login failed
class BookingFailureState  extends BookingState  {
  final String errorMessage;

  BookingFailureState (this.errorMessage);
}



class GetBookingSuccessState  extends BookingState  {
 final GetBookingResponse getBookingResponse;
  GetBookingSuccessState (this.getBookingResponse);
}


class GetBookingFailureState  extends BookingState  {
  final String errorMessage;

  GetBookingFailureState (this.errorMessage);
}


