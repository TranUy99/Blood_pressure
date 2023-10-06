import 'dart:developer';

import 'package:rxdart/rxdart.dart';

import '../../../core/remote/response/doctor_response/doctor_response.dart';
import '../service/doctor_service.dart';
import 'doctor_event.dart';
import 'doctor_state.dart';

class DoctorBloc {
  final BehaviorSubject<DoctorState> _doctorStateSubject = BehaviorSubject<DoctorState>();

  Stream<DoctorState> get doctorStateStream => _doctorStateSubject.stream;
  
  final BehaviorSubject<ScheduleState> _scheduleStateSubject = BehaviorSubject<ScheduleState>();

  Stream<ScheduleState> get scheduleStateStream => _scheduleStateSubject.stream;
  Future<void> getDoctor(FetchDoctorEvent event) async {
    try {
      final DoctorResponse getDoctor = await DoctorService.getDoctor();
     
      if (getDoctor.errCode == 0) {
        _doctorStateSubject.sink.add(DoctorLoadedState(getDoctor));
      } else {
        _doctorStateSubject.sink.add(DoctorErrorState("No  available"));
      }
    } catch (e) {
      _doctorStateSubject.sink.add(DoctorErrorState("No  available"));
    }
  }


  Future<void> getSchedule(DoctorEvent event) async {
       if (event is GetScheduleEvent) {
      final doctorId = event.doctorId;
      final workDate = event.workDate;
  

      try {
        final scheduleResult = await DoctorService.getSchedule(doctorId, workDate);
        if (scheduleResult.errCode == 0) {
          _scheduleStateSubject.sink.add(SuccessScheduleState(scheduleResult));
        } else {
          _scheduleStateSubject.sink.add(ErrorScheduleState("error"));
        }
      } catch (e) {
        _scheduleStateSubject.add(ErrorScheduleState("error"));
      }
    }
  }

  void dispose() {
    _doctorStateSubject.close();
    _scheduleStateSubject.close();
  }
}
