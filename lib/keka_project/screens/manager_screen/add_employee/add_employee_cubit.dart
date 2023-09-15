import 'package:bloc/bloc.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'add_employee_state.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  AddEmployeeCubit(AddEmployeeState addEmployeeState)
      : super(AddEmployeeState(
          dateController: TextEditingController(),
          emailController: TextEditingController(),
          nameController: TextEditingController(),
          mobileController: TextEditingController(),
          passwordController: TextEditingController(),
          departmentList: depList,
        ));

  void visibility() {
    emit(state.copyWith(iconShowHide: !state.iconShowHide));
  }

  void dateTime(context) async {
    DateTime? pikedDate = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2025));

    if (pikedDate != null) {
      String formattedDate = DateFormat.yMMMMd('en_US').format(pikedDate);
      state.dateController.text = formattedDate;
    }
    emit(state.copyWith(dateController: state.dateController));
  }

  void validation(context) {
    if (state.nameController.text.isEmpty ||
        state.emailController.text.isEmpty ||
        state.passwordController.text.isEmpty ||
        state.selectedValue.toString().isEmpty ||
        state.mobileController.text.isEmpty ||
        state.dateController.text.isEmpty) {
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

List<Department> depList = [
  Department(department: "All"),
  Department(department: "Flutter"),
  Department(department: "Android"),
  Department(department: "Laravel"),
  Department(department: "PHP"),
  Department(department: "NodeJs"),
  Department(department: "IOS"),
  Department(department: "ReactJS"),
];
