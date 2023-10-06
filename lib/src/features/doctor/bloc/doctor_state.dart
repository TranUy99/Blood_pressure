
import 'package:blood_pressure/src/core/remote/response/doctor_response/doctor_response.dart';
import 'package:blood_pressure/src/core/remote/response/schedule_response.dart/schedule_response.dart';

abstract class DoctorState {}
abstract class ScheduleState {}

class DoctorLoadedState extends DoctorState {
  
  final DoctorResponse getDoctorResponse;
  DoctorLoadedState(this.getDoctorResponse);
}

class DoctorErrorState extends DoctorState {
  final String errorMessage;
  DoctorErrorState(this.errorMessage);
}

class SuccessScheduleState extends ScheduleState {
  
  final ScheduleResponse getScheduleResponse;
  SuccessScheduleState(this.getScheduleResponse);
}

class ErrorScheduleState extends ScheduleState {
  final String errorMessage;
  ErrorScheduleState(this.errorMessage);
}

class GetScheduleIdState extends ScheduleState{
  final int? scheduledId;

  GetScheduleIdState({this.scheduledId});
}