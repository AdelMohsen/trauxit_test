import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_test/logic/authentication/auth/auth_cubit.dart';
import 'package:trauxit_test/logic/authentication/auth/auth_state.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/default_form_field.dart';
import 'package:trauxit_test/utilities/constance/utils.dart';

class LoginInputFormFieldWidget extends StatelessWidget {
  const LoginInputFormFieldWidget(this.cubit, this.formKey, {super.key});
  final AuthCubit cubit;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) => current is ChangeObsecureSuccess,
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultFormField(
                titleText: 'Email',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) => validateEmail(value),
                textColor: SharedColor.white,
              ),
              DefaultFormField(
                titleText: 'Password',
                hintText: 'Enter your password',
                obscureText: cubit.loginObsecure,
                textColor: SharedColor.white,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => validatePassword(value),
                errorMaxLines: 2,
                suffixIcon: cubit.loginObsecure
                    ? IconButton(
                        onPressed: () {
                          cubit.changeLoginObsecure();
                        },
                        icon: Icon(
                          Icons.visibility_off_outlined,
                          color: SharedColor.secondryColor,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          cubit.changeLoginObsecure();
                        },
                        icon: Icon(
                          Icons.visibility_outlined,
                          color: SharedColor.secondryColor,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
