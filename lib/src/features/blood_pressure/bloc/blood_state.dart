import 'package:blood_pressure/src/core/model/blood.dart';

import '../../../core/remote/response/blood_response/blood_response.dart';
import '../../../core/remote/response/blood_response/get_blood_response.dart';

abstract class BloodState {}

class InitialState extends BloodState {
  // Trạng thái khởi tạo
}

//State for login success
class SuccessBloodState extends BloodState {
 final BloodResponse getBloodResponse;
  SuccessBloodState(this.getBloodResponse);
}

//State for login failed
class ErrorBloodState extends BloodState {
  final String errorMessage;

  ErrorBloodState(this.errorMessage);
}


class BloodLoadedState extends BloodState {
  
  final GetBloodResponse getBloodResponse;
  BloodLoadedState(this.getBloodResponse);
}

class BloodErrorState extends BloodState {
  final String errorMessage;
  BloodErrorState(this.errorMessage);
}

class SuccessGetBloodByIdState extends BloodState {
 final BloodResponse getBloodResponse;
  SuccessGetBloodByIdState(this.getBloodResponse);
}

//State for login failed
class ErrorGetBloodByIdState extends BloodState {
  final String errorMessage;

  ErrorGetBloodByIdState(this.errorMessage);
}
