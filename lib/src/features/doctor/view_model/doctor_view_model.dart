import 'dart:async';

import 'package:blood_pressure/src/core/remote/response/doctor_response/doctor_response.dart';
import 'package:blood_pressure/src/features/doctor/bloc/doctor_bloc.dart';
import 'package:blood_pressure/src/features/doctor/bloc/doctor_event.dart';
import 'package:blood_pressure/src/features/doctor/bloc/doctor_state.dart';

class DoctorViewModel {
  final DoctorBloc _doctorBloc = DoctorBloc();

  Future<DoctorResponse> getDoctor() async {
    final doctorEvent = FetchDoctorEvent();
    DoctorResponse doctorResponse;

    Completer<DoctorResponse> completer = Completer<DoctorResponse>();

    await _doctorBloc.getDoctor(doctorEvent);

    StreamSubscription<DoctorState>? subscription;
    subscription = _doctorBloc.doctorStateStream.listen((state) {
      if (state is DoctorLoadedState) {
        doctorResponse = state.getDoctorResponse;
        completer.complete(doctorResponse);
        subscription!.cancel();
      } else if (state is DoctorErrorState) {
        completer.completeError('Error fetching products');
        subscription!.cancel();
      }
    });

    return completer.future;
  }
}
