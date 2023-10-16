// ignore_for_file: non_constant_identifier_names

import 'dart:async';


import '../../../core/remote/response/blood_response/blood_response.dart';
import '../../../core/remote/response/blood_response/get_blood_response.dart';
import '../bloc/blood_bloc.dart';
import '../bloc/blood_event.dart';
import '../bloc/blood_state.dart';

class BloodViewModel {
  final BloodBloc _bloodBloc = BloodBloc();

  Future<BloodResponse> createBlood(double? SystolicPressure, double? DiastolicPressure,
      double? PulsePressure, double? HeartRate, double? BodyTemperature, String? createDay) async {
    final BloodEvent = BloodButtonPressedEvent(
        SystolicPressure: SystolicPressure,
        DiastolicPressure: DiastolicPressure,
        PulsePressure: PulsePressure,
        HeartRate: HeartRate,
        BodyTemperature: BodyTemperature,
        createDay: createDay);
    await _bloodBloc.createBlood(BloodEvent);

    StreamSubscription<BloodState>? subscription;
    final completer = Completer<BloodResponse>();

    subscription = _bloodBloc.bloodStateStream.listen(
      (state) {
        if (state is SuccessBloodState) {
          completer.complete(state.getBloodResponse);
          subscription?.cancel();
        } else if (state is ErrorBloodState) {
          completer.completeError('Error fetching products');
          subscription?.cancel();
        }
      },
    );

    return completer.future;
  }

  Future<GetBloodResponse> getBlood() async {
    final productEvent = FetchBloodEvent();
    GetBloodResponse getBloodResponse;

    Completer<GetBloodResponse> completer = Completer<GetBloodResponse>();

    await _bloodBloc.getBlood(productEvent);

    StreamSubscription<BloodState>? subscription;
    subscription = _bloodBloc.bloodStateStream.listen((state) {
      if (state is BloodLoadedState) {
        getBloodResponse = state.getBloodResponse;
        completer.complete(getBloodResponse);
        subscription!.cancel(); // Hủy lắng nghe sau khi nhận được danh sách sản phẩm
      } else if (state is BloodErrorState) {
        completer.completeError('Error fetching products');
        subscription!.cancel();
      }
    });

    return completer.future;
  }

  Future<GetBloodResponse> getBloodReverse() async {
    final productEvent = FetchBloodEvent();
    GetBloodResponse getBloodResponse;

    Completer<GetBloodResponse> completer = Completer<GetBloodResponse>();

    await _bloodBloc.getBloodReverse(productEvent);

    StreamSubscription<BloodState>? subscription;
    subscription = _bloodBloc.bloodStateStream.listen((state) {
      if (state is BloodLoadedState) {
        getBloodResponse = state.getBloodResponse;
        completer.complete(getBloodResponse);
        subscription!.cancel(); // Hủy lắng nghe sau khi nhận được danh sách sản phẩm
      } else if (state is BloodErrorState) {
        completer.completeError('Error fetching products');
        subscription!.cancel();
      }
    });

    return completer.future;
  }

  Future<BloodResponse> getBloodById(int? id) async {
    
    final getBloodById = GetBloodById(id: id);
    BloodResponse bloodResponse;

    Completer<BloodResponse> completer = Completer<BloodResponse>();

    await _bloodBloc.getBloodById(getBloodById);

    StreamSubscription<BloodState>? subscription;
    subscription = _bloodBloc.bloodStateStream.listen((state) {
      if (state is SuccessGetBloodByIdState) {
        bloodResponse = state.getBloodResponse;
        completer.complete(bloodResponse);
        subscription!.cancel(); // Hủy lắng nghe sau khi nhận được danh sách sản phẩm
      } else if (state is ErrorGetBloodByIdState) {
        completer.completeError('Error fetching products');
        subscription!.cancel();
      }
    });

    return completer.future;
  }

  void dispose() {
    _bloodBloc.dispose();
  }
}
