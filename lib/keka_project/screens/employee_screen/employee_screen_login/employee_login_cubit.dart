import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'employee_login_state.dart';

class EmployeeLoginCubit extends Cubit<EmployeeLoginState> {
  EmployeeLoginCubit(super.initialState);

  void visibility() {
    emit(state.copyWith(iconShowHide: !state.iconShowHide));
  }

  void validation(context) {
    if (state.emailController.text.toString().isEmpty ||
        state.passwordController.text.toString().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          padding: EdgeInsets.all(3),
          backgroundColor: Colors.red,
          content: Text(
            "Please fill all the fields",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textScaleFactor: 1.3,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
