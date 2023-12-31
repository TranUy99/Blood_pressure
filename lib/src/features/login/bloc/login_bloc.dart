import 'dart:async';
import 'dart:developer';
import 'package:blood_pressure/src/features/login/bloc/login_event.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../main.dart';

import '../service/login_service.dart';
import 'login_state.dart';

SuccessLoginState successLoginState = SuccessLoginState(
  false,
);

class LoginBloc {
  String? message;
  bool verifiedStatus = false;
  int? error;
  String? token;

  final _stateController = BehaviorSubject<LoginState>();
  Stream<LoginState> get state => _stateController.stream;

  //Get event login
  Future<void> handleEvent(LoginEvent event) async {
    await _login(event.email, event.password, event.isRemember);
  }

  //Call api and get data user
  Future<void> _login(String email, String password, bool? isRemember) async {
    final loginResult = LoginService.loginService(email, password);
    try {
      await loginResult.then((value) {
        message = value.message;
        error = value.errCode;
        token = value.token;

        getUser.idUser = value.idUser!;
        getUser.token = value.token;
        getUser.email = email;
        getUser.password = password;
        getUser.isRemember = isRemember;
      });
    } catch (e) {
      message = '$e';
    }

    try {
      getUser.userDTO = await UserService.userService(getUser.idUser!, getUser.token!);
      verifiedStatus = (getUser.userDTO.statusDTO)!;
    } catch (e) {
      message = '$e';
    }

    if (token != null) {
      _stateController.add(successLoginState = SuccessLoginState(
        true,
      ));

      successLoginState.saveLoginState(
          getUser.email, getUser.password, getUser.token, getUser.idUser, getUser.isRemember);
    } else {
      _stateController.add(ErrorLoginState(message!));
    }
  }

  void dispose() {
    _stateController.close();
  }
}
