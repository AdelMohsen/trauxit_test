import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_test/logic/authentication/auth/auth_state.dart';
import 'package:trauxit_test/presentation/nav_bar_screens/home_layout.dart';
import 'package:trauxit_test/utilities/constance/navigation.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool loginObsecure = true;
  changeLoginObsecure() {
    loginObsecure = !loginObsecure;
    emit(ChangeObsecureSuccess());
  }

  loginRequest(BuildContext context) async {
    emit(LoginLoadingState());
    await Future.delayed(const Duration(seconds: 1))
        .then((_) => Move.navigatorAllOff(context, const HomeLayoutScreen()));
    emit(LoginSuccessState());
  }
}
