import 'dart:developer';


import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

enum LoginStatusEnum { successLogin, successLoginWithoutVerified, errorLogin }

class LoginViewModel {
  final LoginBloc _loginBloc = LoginBloc();

  //Add event
  Future<int?> login(String email, String password, bool isRemember) async {
    await _loginBloc.handleEvent(LoginEvent(email, password, isRemember));
    int? isLogin;

    //Listen from state
    await _loginBloc.state.listen(
      (state) {
        if (state is SuccessLoginState) {
          
            isLogin = LoginStatusEnum.successLogin.index;
        
         
        } else if (state is ErrorLoginState) {
          isLogin = LoginStatusEnum.errorLogin.index;
        }
      },
    );

    return isLogin;
  }

  void dispose() {
    _loginBloc.dispose();
  }
}