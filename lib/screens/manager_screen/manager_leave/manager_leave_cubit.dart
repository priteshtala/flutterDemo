import 'package:finaldemo/keka_project/model/leave_model/leave_model.dart';
import 'package:finaldemo/screens/main_screen/main_screen_view.dart';
import 'package:finaldemo/screens/manager_screen/department_details/department_details_view.dart';
import 'package:finaldemo/screens/manager_screen/employee_details/employee_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'manager_leave_state.dart';

class ManagerScreenCubit extends Cubit<ManagerScreenState> {
  ManagerScreenCubit()
      : super(
          ManagerScreenState(
            leaveList: [
              Leave(name: "Devang", surname: "Sabalpara"),
              Leave(name: "Pritesh", surname: "Tala"),
              Leave(name: "Deep", surname: "Vaghani"),
              Leave(name: "Kuldeep", surname: "Ghoghari"),
              Leave(name: "Nemanshu", surname: "Bhalala"),
              Leave(name: "Akash", surname: "Valani"),
              Leave(name: "Khushali", surname: "Sutariya"),
              Leave(name: "Nensi", surname: "Tala"),
            ],
            dateController: TextEditingController(),
          ),
        );

  void dateTime(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat.yMMMMd('en_US').format(pickedDate);
      state.dateController.text = formattedDate;
    }
    emit(state.copyWith(dateController: state.dateController));
  }

  alert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          title: const Text("Log Out?"),
          actions: [
            MaterialButton(
              splashColor: Colors.red,
              shape: Border.all(color: Colors.black),
              onPressed: () {
                Navigator.of(context).pushNamed(MainScreenView.routeName);
              },
              child: const Text("Yes", style: TextStyle(color: Colors.red)),
            ),
            MaterialButton(
              shape: Border.all(color: Colors.black),
              onPressed: () => Navigator.pop(context),
              child: const Text("No"),
            )
          ],
        );
      },
    );
  }

  void navigateToDepartmentView(context) {
    Navigator.of(context).pushNamed(DepartmentDetailsView.routeName);
  }

}
