// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:developer';
import 'package:rxdart/rxdart.dart';
import '../../../../main.dart';
import '../../../core/remote/response/blood_response/get_blood_response.dart';
import '../service/blood_service.dart';
import 'blood_event.dart';
import 'blood_state.dart';

class BloodBloc {
  final BehaviorSubject<BloodState> _BloodStateSubject = BehaviorSubject<BloodState>();

  Stream<BloodState> get bloodStateStream => _BloodStateSubject.stream;

  //Get event and call api Blood
  Future<void> createBlood(BloodEvent event) async {
    if (event is BloodButtonPressedEvent) {
      final SystolicPressure = event.SystolicPressure;
      final DiastolicPressure = event.DiastolicPressure;
      final PulsePressure = event.PulsePressure;
      final HeartRate = event.HeartRate;
      final BodyTemperature = event.BodyTemperature;
      final createDay = event.createDay;

      try {
        final BloodResult = await BloodService.createBloodService(SystolicPressure,
            DiastolicPressure, PulsePressure, HeartRate, BodyTemperature, createDay);
        if (BloodResult.errCode == 0) {
          _BloodStateSubject.sink.add(SuccessBloodState(BloodResult));
        } else {
          _BloodStateSubject.sink.add(ErrorBloodState("error"));
        }
      } catch (e) {
        _BloodStateSubject.add(ErrorBloodState("error"));
      }
    }
  }

  Future<void> getBlood(FetchBloodEvent event) async {
    try {
      final GetBloodResponse getBlood = await BloodService.getBlood();

      if (getBlood.errCode == 0) {
        _BloodStateSubject.sink.add(BloodLoadedState(getBlood));
      } else {
        _BloodStateSubject.sink.add(BloodErrorState("No  available"));
      }
    } catch (e) {
      _BloodStateSubject.sink.add(BloodErrorState("No  available"));
    }
  }

  Future<void> getBloodReverse(FetchBloodEvent event) async {
    try {
      final GetBloodResponse getBlood = await BloodService.getBloodReverse();

      if (getBlood.errCode == 0) {
        _BloodStateSubject.sink.add(BloodLoadedState(getBlood));
      } else {
        _BloodStateSubject.sink.add(BloodErrorState("No  available"));
      }
    } catch (e) {
      _BloodStateSubject.sink.add(BloodErrorState("No  available"));
    }
  }

  void dispose() {
    _BloodStateSubject.close();
  }
}
