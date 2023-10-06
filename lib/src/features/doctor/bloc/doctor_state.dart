
import 'package:blood_pressure/src/core/remote/response/doctor_response/doctor_response.dart';

abstract class DoctorState {}


class DoctorLoadedState extends DoctorState {
  
  final DoctorResponse getDoctorResponse;
  DoctorLoadedState(this.getDoctorResponse);
}

class DoctorErrorState extends DoctorState {
  final String errorMessage;
  DoctorErrorState(this.errorMessage);
}