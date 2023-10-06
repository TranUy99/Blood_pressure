import 'dart:developer';

import 'package:rxdart/rxdart.dart';

import '../../../core/remote/response/doctor_response/doctor_response.dart';
import '../service/doctor_service.dart';
import 'doctor_event.dart';
import 'doctor_state.dart';

class DoctorBloc {
  final BehaviorSubject<DoctorState> _DoctorStateSubject = BehaviorSubject<DoctorState>();

  Stream<DoctorState> get doctorStateStream => _DoctorStateSubject.stream;

  Future<void> getDoctor(FetchDoctorEvent event) async {
    try {
      final DoctorResponse getDoctor = await DoctorService.getDoctor();
     
      if (getDoctor.errCode == 0) {
        _DoctorStateSubject.sink.add(DoctorLoadedState(getDoctor));
      } else {
        _DoctorStateSubject.sink.add(DoctorErrorState("No  available"));
      }
    } catch (e) {
      _DoctorStateSubject.sink.add(DoctorErrorState("No  available"));
    }
  }

  void dispose() {
    _DoctorStateSubject.close();
  }
}
