import 'package:bloc/bloc.dart';
import 'package:finaldemo/keka_project/common/const.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/employee_screen_login/employee_login_view.dart';
import 'package:finaldemo/keka_project/screens/employee_screen/employee_screen_login/shardpref.dart';
import 'package:finaldemo/keka_project/screens/manager_screen/manager_leave/manager_leave_view.dart';
import 'package:flutter/material.dart';

import 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit(super.initialState);

  void isSelectedColor(int i) {
    if (state.isSelected == i) {
      emit(state.copyWith(isSelected: -1));
    } else {
      emit(state.copyWith(isSelected: i));
    }

    debugPrint("IsChange ::: ${state.isSelected}");
  }

  void validation(context) async {
    if (state.isSelected == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          padding: EdgeInsets.all(3),
          backgroundColor: Colors.red,
          content: Text(
            "Select Type",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textScaleFactor: 1.3,
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else if (state.isSelected == 0) {
      Navigator.of(context).pushNamed(ManagerLeaveView.routeName, arguments: Profile.manager);
    } else {
      var getToken = await Helper().getToken();
      getToken.isNotEmpty
          ? Navigator.of(context).pushNamed(ManagerLeaveView.routeName, arguments: Profile.employee)
          : Navigator.of(context).pushNamed(
              EmployeeLoginView.routeName,
            );
    }
  }
}
