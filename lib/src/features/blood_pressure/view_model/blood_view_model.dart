import 'dart:async';
import 'dart:developer';

import 'package:blood_pressure/src/core/remote/response/blood_response/get_blood_response.dart';

import '../bloc/blood_bloc.dart';
import '../bloc/blood_event.dart';
import '../bloc/blood_state.dart';

class BloodViewModel {
  final BloodBloc _bloodBloc = BloodBloc();

  Future<bool> createBlood(double? sys, double? dia, double? pulse, String? createDay) async {
    final BloodEvent =
        BloodButtonPressedEvent(sys: sys, dia: dia, pulse: pulse, createDay: createDay);
    await _bloodBloc.createBlood(BloodEvent);

    bool isBlood = false;

    await _bloodBloc.bloodStateStream.listen(
      (state) {
        if (state is SuccessBloodState) {
          isBlood = true;
        } else if (state is ErrorBloodState) {
          isBlood = false;
        }
      },
    );

    return isBlood;
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
  void dispose() {
    _bloodBloc.dispose();
  }
}
