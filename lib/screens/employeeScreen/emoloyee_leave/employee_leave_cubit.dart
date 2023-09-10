import 'package:finaldemo/keka_project/model/leave_model/leave_model.dart';
import 'package:finaldemo/screens/employeeScreen/emoloyee_leave/employee_leave_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class EmployeeScreenCubit extends Cubit<EmployeeScreenState> {
  EmployeeScreenCubit()
      : super(
    EmployeeScreenState(
      empList: [
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
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat.yMMMMd('en_US').format(pickedDate);
      state.dateController.text = formattedDate;
    }
    emit(state.copyWith(dateController: state.dateController));
  }
}
