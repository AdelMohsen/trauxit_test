import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_test/logic/authentication/auth/auth_cubit.dart';
import 'package:trauxit_test/logic/authentication/auth/auth_state.dart';
import 'package:trauxit_test/presentation/authentication/widgets/input_form_field_widget.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/default_button.dart';
import 'package:trauxit_test/utilities/shared_widgets/appbar_widget.dart';
import 'package:trauxit_test/utilities/shared_widgets/icon_with_oval_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final cubit = AuthCubit.get(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: CustomeAppBarWidget(backgroundColor: SharedColor.primaryColor),
      ),
      body: Container(
        height: height,
        width: width,
        alignment: Alignment.bottomCenter,
        color: SharedColor.primaryColor,
        child: Column(
          children: [
            const Expanded(child: IconWithOvalWidget(needOval: false)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: height * .50,
                      decoration: decoration(),
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 10.0, 20.0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //--------------INPUTS------------------------//
                            LoginInputFormFieldWidget(cubit, formKey),
                            //-----------BUTTONS---------------------------------//
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 6, top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  BlocBuilder<AuthCubit, AuthState>(
                                    buildWhen: (previous, current) =>
                                        current is LoginLoadingState ||
                                        current is LoginSuccessState,
                                    builder: (context, state) {
                                      return DefaultButton(
                                        isLoading: state is! LoginLoadingState
                                            ? false
                                            : true,
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            cubit.loginRequest(context);
                                          }
                                        },
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Decoration decoration() => BoxDecoration(
        color: SharedColor.black.withOpacity(.95),
        borderRadius: const BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(0.0),
          bottomStart: Radius.circular(0.0),
          topEnd: Radius.circular(80.0),
          topStart: Radius.circular(80.0),
        ),
      );
}
