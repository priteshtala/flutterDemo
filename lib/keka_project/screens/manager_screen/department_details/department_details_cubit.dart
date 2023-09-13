import 'package:bloc/bloc.dart';
import 'package:finaldemo/keka_project/model/department_model/department_model.dart';
import 'package:finaldemo/keka_project/model/leave_model/leave_model.dart';
import 'package:flutter/material.dart';
import 'department_details_state.dart';

class DepartmentDetailsCubit extends Cubit<DepartmentDetailsState> {
  DepartmentDetailsCubit()
      : super(
          DepartmentDetailsState(
            departmentController: TextEditingController(),
            leaveSearchList: leaveEmpList,
            departmentList: [
              Department(department: "Flutter"),
              Department(department: "Android"),
              Department(department: "Laravel"),
              Department(department: "PHP"),
              Department(department: "NodeJs"),
              Department(department: "IOS"),
              Department(department: "ReactJS"),
            ],
          ),
        );

  addDepartment(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          actionsPadding: EdgeInsets.all(10),
          alignment: Alignment.center,
          title: const Text("Add Department"),
          actions: [
            TextFormField(
              decoration: InputDecoration(hintText: "Enter Department"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  splashColor: Colors.blue,
                  shape: Border.all(color: Colors.black),
                  onPressed: () {
                    staticList();
                    print("ADDD::${state.departmentList}");
                  },
                  child: const Text("Add", style: TextStyle(color: Colors.blue)),
                ),
                MaterialButton(
                  shape: Border.all(color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("No"),
                )
              ],
            )
          ],
        );
      },
    );
  }

  void departmentSearch(String query) {
    List<Department> leaveList = List<Department>.from(state.departmentList);
    leaveList = leaveList.where((element) => element.department.toLowerCase().contains(query.toLowerCase())).toList();
    emit(state.copyWith(leaveSearchList: leaveList));
  }

  void staticList() {
    state.departmentList.add(Department(department: state.departmentController.text));
    emit(state.copyWith(departmentList: state.departmentList));
    print("ADDD::${state.departmentList}");

  }
}

List<Department> leaveEmpList = [
  Department(department: "Flutter"),
  Department(department: "Android"),
  Department(department: "Laravel"),
  Department(department: "PHP"),
  Department(department: "NodeJs"),
  Department(department: "IOS"),
  Department(department: "ReactJS"),
];
